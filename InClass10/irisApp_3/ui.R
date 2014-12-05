#Sean Cordrey
#uiIris

shinyUI(pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput('xcol', 'X Variable', names(iris1)),
    selectInput('ycol', 'Y Variable', names(iris1),
                selected=names(iris1)[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 1, max = 3)
  ),
  mainPanel(
    plotOutput('plot1')
  )
))