import Highcharts
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let chartView = HIChartView(frame: view.bounds)
    chartView.plugins = ["series-label"]

    let options = HIOptions()

    let title = HITitle()
    title.text = "CO2 reading vs. time"
    options.title = title

    let subtitle = HISubtitle()
    subtitle.text = "Experiment in-car"
    options.subtitle = subtitle

    let yAxis = HIYAxis()
    yAxis.title = HITitle()
    yAxis.title.text = "CO2 level (ppm)"
    options.yAxis = [yAxis]

    let xAxis = HIXAxis()
    xAxis.accessibility = HIAccessibility()
    xAxis.accessibility.rangeDescription = "Range: 2010 to 2017"
    options.xAxis = [xAxis]

    let legend = HILegend()
    legend.layout = "vertical"
    legend.align = "right"
    legend.verticalAlign = "middle"
    options.legend = legend

    let plotOptions = HIPlotOptions()
    plotOptions.series = HISeries()
    plotOptions.series.label = HILabel()
    plotOptions.series.label.connectorAllowed = false
    plotOptions.series.pointStart = 2010
    options.plotOptions = plotOptions

    let co2levels = HISeries()
    co2levels.name = "Installation"
    co2levels.data = [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]


    options.series = [co2levels]

    let responsive = HIResponsive()
    let rules = HIRules()
    rules.condition = HICondition()
    rules.condition.maxWidth = 500
    rules.chartOptions = [
      "legend": [
         "layout": "horizontal",
         "align": "center",
         "verticalAlign": "bottom"
      ]
    ]
    responsive.rules = [rules]
    options.responsive = responsive

    chartView.options = options

    self.view.addSubview(chartView)
  }

}

