package com.jetbrains.handson.mpp.mobile

import IResponse

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.BaseAdapter
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private lateinit var adapter: BaseAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        main_text.text = createApplicationScreenMessage()

        val list = arrayListOf<String>()
        setupAdapter(list)

        HttpBinClient().runGet(object : IResponse {
            override fun onResult(item: ArrayList<String>) {
                runOnUiThread {
                    setupAdapter(item)
                }
            }
        })
    }

    private fun setupAdapter(list: ArrayList<String>){
        adapter = ArrayAdapter(applicationContext, android.R.layout.simple_list_item_1, list)
        listView.adapter = null
        listView.adapter = adapter
    }
}


