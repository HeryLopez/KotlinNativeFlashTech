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

        HttpBinClient().runGet(object : IResponse {
            override fun onResult(item: ArrayList<String>) {
                runOnUiThread {
                    listView.adapter = null
                    adapter = ArrayAdapter(applicationContext, android.R.layout.simple_list_item_1, item)
                    listView.adapter = adapter
                    adapter.notifyDataSetChanged()
                }
            }
        })

        main_text.text = createApplicationScreenMessage()

        val list = mutableListOf<String>()
        adapter = ArrayAdapter(applicationContext, android.R.layout.simple_list_item_1, list)
        listView.adapter = adapter
    }
}


