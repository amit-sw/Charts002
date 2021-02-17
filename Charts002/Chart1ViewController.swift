//
//  Chart1ViewController.swift
//  Charts002
//
//  Created by Amit Gupta on 2/16/21.
//

import UIKit
import Highcharts
import Charts
import TinyConstraints

class Chart1ViewController: UIViewController, ChartViewDelegate {
    
    var chartView: HIChartView!
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        chartView.rightAxis.enabled=false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(10, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(10, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .white
        
        chartView.animate(xAxisDuration: 4.0)
        
        
        
        return chartView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        chartView = HIChartView(frame: CGRect(x: view.bounds.origin.x, y: view.bounds.origin.y  +  20, width: view.bounds.size.width, height: 300))
        let options = HIOptions()

        let chart = HIChart()
        chart.type = "column"
        options.chart = chart

        let title = HITitle()
        title.text = "Demo chart"
        options.title = title

        let series = HIColumn()
        series.data = [49.9, 71.5, 106.4, 129.2, 144, 176, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        options.series = [series]

        chartView.options = options

        view.addSubview(chartView)
        // Do any additional setup after loading the view.
        /*
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        setData()
 */
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData() {
        let set1 = LineChartDataSet(entries: yValues, label: "Subs")
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 3
        set1.setColor(.white)
        
        let data=LineChartData(dataSet: set1)
        lineChartView.data=data
    }
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.5, y: 5.0),
        ChartDataEntry(x: 0.1, y: 20.0),
        ChartDataEntry(x: 5.0, y: 12.0),
        ChartDataEntry(x: 1.0, y: 15.0),
        ChartDataEntry(x: 4.0, y: 19.0),
        ChartDataEntry(x: 2.0, y: 24.0),
        ChartDataEntry(x: 3.0, y: 30.0)
        
    ]


}
