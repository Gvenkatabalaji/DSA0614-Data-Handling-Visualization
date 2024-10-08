# Load necessary libraries
library(ggplot2)
library(plotly)

# Create the dataset
financial_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# Scatter plot for Stock Price vs Volume Traded
ggplot(financial_data, aes(x = VolumeTraded, y = StockPrice)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Stock Price vs Volume Traded",
       x = "Volume Traded (millions)",
       y = "Stock Price ($)") +
  theme_minimal()

# Scatter plot for Stock Price vs Market Cap
ggplot(financial_data, aes(x = MarketCap, y = StockPrice)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Stock Price vs Market Capitalization",
       x = "Market Capitalization ($)",
       y = "Stock Price ($)") +
  theme_minimal()
# 3D scatter plot
plot_ly(financial_data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~StockPrice, colorscale = 'Viridis')) %>%
  layout(title = '3D Scatter Plot of Stock Price, Volume Traded, and Market Capitalization',
         scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Capitalization ($)'),
                      zaxis = list(title = 'Stock Price ($)')))
# k-means clustering
set.seed(123)
clusters <- kmeans(financial_data[, -1], centers = 2) # Adjust the number of centers as needed

# Add cluster information to the data
financial_data$Cluster <- as.factor(clusters$cluster)

# 3D scatter plot with clustering
plot_ly(financial_data, x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, color = ~Cluster, colors = c('blue', 'red'),
        type = 'scatter3d', mode = 'markers', marker = list(size = 5)) %>%
  layout(title = '3D Scatter Plot with Clustering',
         scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Capitalization ($)'),
                      zaxis = list(title = 'Stock Price ($)')))
# 3D surface plot
plot_ly(financial_data, x = ~StockPrice, y = ~VolumeTraded, z = ~MarketCap, type = 'surface') %>%
  layout(title = '3D Surface Plot of Market Capitalization',
         scene = list(xaxis = list(title = 'Stock Price ($)'),
                      yaxis = list(title = 'Volume Traded (millions)'),
                      zaxis = list(title = 'Market Capitalization ($)')))
# 3D surface plot for Stock Price vs Volume Traded
plot_ly(x = ~VolumeTraded, y = ~MarketCap, z = ~StockPrice, type = 'surface') %>%
  layout(title = 'Stock Price vs Volume Traded and Market Capitalization',
         scene = list(xaxis = list(title = 'Volume Traded (millions)'),
                      yaxis = list(title = 'Market Capitalization ($)'),
                      zaxis = list(title = 'Stock Price ($)')))

