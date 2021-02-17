//
//  Chart4ViewController.swift
//  Charts002
//
//  Created by Amit Gupta on 2/16/21.
//

import Highcharts
import UIKit

class Chart4ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let chartView = HIChartView(frame: view.bounds)
    chartView.plugins = ["series-label"]

    let options = HIOptions()

    let chart = HIChart()
    chart.type = "spline"
    options.chart = chart

    let title = HITitle()
    title.text = "CO2 levels during car ride"
    options.title = title

    let subtitle = HISubtitle()
    subtitle.text = "Impact of ventilation changes"
    options.subtitle = subtitle

    let xAxis = HIXAxis()
    xAxis.type = "datetime"
    xAxis.title = HITitle()
    xAxis.title.text = "Date"
    xAxis.dateTimeLabelFormats = HIDateTimeLabelFormats() // don't display the dummy year
    xAxis.dateTimeLabelFormats.month = HIMonth()
    xAxis.dateTimeLabelFormats.month.main = "%e. %b"
    xAxis.dateTimeLabelFormats.year = HIYear()
    xAxis.dateTimeLabelFormats.year.main = "%b"
    options.xAxis = [xAxis]

    let yAxis = HIYAxis()
    yAxis.title = HITitle()
    yAxis.title.text = "CO2 levels (ppm)"
    yAxis.min = 0
    options.yAxis = [yAxis]

    let tooltip = HITooltip()
    tooltip.headerFormat = "<b>{series.name}</b><br>"
    tooltip.pointFormat = "{point.x:%e. %b}: {point.y:.2f} m"
    options.tooltip = tooltip

    let plotOptions = HIPlotOptions()
    plotOptions.series = HISeries()
    plotOptions.series.marker = HIMarker()
    plotOptions.series.marker.enabled = true
    options.plotOptions = plotOptions

    let colors = ["#6CF", "#39F", "#06C", "#036", "#000"]
    options.colors = colors

    // Define the data points. All series have a dummy year
    // of 1970/71 in order to be compared on the same x axis. Note
    // that in JavaScript, months start at 0 for January, 1 for February etc.

    let winter20142015 = HISpline()
    winter20142015.name = "Series name"
    winter20142015.data = [
      [25653600000, 0],
      [26694000000, 0.25],
      [27903600000, 1.41],
      [28335600000, 1.64],
      [29113200000, 1.6],
      [30236400000, 2.55],
      [30841200000, 2.62],
      [31791600000, 2.5],
      [32655600000, 2.42],
      [34642800000, 2.74],
      [35334000000, 2.62],
      [36198000000, 2.6],
      [36630000000, 2.81],
      [37494000000, 2.63],
      [38876400000, 2.77],
      [39564000000, 2.68],
      [39996000000, 2.56],
      [40428000000, 2.39],
      [40860000000, 2.3],
      [42156000000, 2],
      [42588000000, 1.85],
      [43020000000, 1.49],
      [43452000000, 1.27],
      [43884000000, 0.99],
      [44316000000, 0.67],
      [44748000000, 0.18],
      [44748000000, 0]
    ]


 

    options.series = [winter20142015]
    
    
    let annotations3 = HIAnnotations()
    annotations3.labelOptions = HILabelOptions()
    annotations3.labelOptions.shape = "connector"
    annotations3.labelOptions.align = "right"
//    annotations3.labelOptions.justify = false
    annotations3.labelOptions.crop = true
    annotations3.labelOptions.style = HICSSObject()
    annotations3.labelOptions.style.fontSize = "0.8em"
    annotations3.labelOptions.style.textOutline = "1px white"

    let labels31 = HILabels()
    labels31.point = HIPoint()
    labels31.point.xAxis = 0
    labels31.point.yAxis = 0
    labels31.point.x = 35334000000
    labels31.point.y = 2.62
    labels31.text = "6.1 km climb 4.6% on avg."
    annotations3.labels = [labels31]

    options.annotations = [annotations3]
    

    let responsive = HIResponsive()
    let rule = HIRules()
    rule.condition = HICondition()
    rule.condition.maxWidth = 500
    rule.chartOptions = [
      "plotOptions": [
        "series": [
          "marker": [
            "radius": 2.5
          ]
        ]
      ]
    ]
    responsive.rules = [rule]
    options.responsive = responsive

    chartView.options = options

    self.view.addSubview(chartView)
  }

}
