//
//  Extensions.swift
//  cryptoCurrency
//
//  Created by Baudunov Rapkat on 4/25/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit
import Charts

extension SecondViewController{
    
    func setData(){
        let set = LineChartDataSet(entries: entries)
        
        set.mode = .cubicBezier
        set.drawCirclesEnabled = false
        set.lineWidth = 2
        set.setColor(.white)
        set.fill = Fill(color: .white)
        set.fillAlpha = 0.8
        set.drawFilledEnabled = true
        
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.highlightColor = .systemRed
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        lineChartView.data = data
    }
    
    func setUI(){
        cryptoName.text = data?.CoinInfo?.FullName?.description
        marketcapView.text = data?.DISPLAY?.USD?.PRICE?.description
        priceVolumeView.text = data?.DISPLAY?.USD?.VOLUME24HOUR?.description
        changeView.text = data?.DISPLAY?.USD?.CHANGE24HOUR?.description
    }
    
    func designForLineChart() -> LineChartView{
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }
}
