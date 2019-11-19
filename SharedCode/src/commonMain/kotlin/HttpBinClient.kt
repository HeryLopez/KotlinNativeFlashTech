package com.jetbrains.handson.mpp.mobile

import IResponse
import kotlinx.serialization.json.JSON

class HttpBinClient: NetworkClient("https://itunes.apple.com/search?term=Michael") {

    fun runGet(callback : IResponse) {
        executeRequest(
            path = "get",
            callback = { result ->
                when (result) {
                    is NetworkResult.Error<String> -> println("Error! : ${result.message}")
                    is NetworkResult.Success<String> -> {

                        val resultObject = JSON.nonstrict.parse(ResultArtist.serializer(), result.item)

                        val list = ArrayList<String>()
                        for (i in resultObject.results.indices) {
                            list.add(resultObject.results[i].artistName)
                        }

                        callback.onResult(list)
                    }
                }
            }
        )
    }

    fun runPost(body: String) {
        executeRequest(
            method = RequestMethod.Post(body),
            path = "post",
            callback = { result ->
                when (result) {
                    is NetworkResult.Error<String> -> println("Error! : ${result.message}")
                    is NetworkResult.Success<String> -> println("Success! Got: \n${result.item}")
                }
            }
        )
    }
}