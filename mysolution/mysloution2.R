library(igraph)

# 2.
g <- barabasi.game(n = 1000, directed = FALSE)

# 3. Wizualizacja
plot(g,
     layout = layout_with_fr(g),
     vertex.size = 3,
     vertex.label = NA,
     vertex.color = "lightblue",
     vertex.frame.color = "darkblue",
     edge.color = "gray70",
     edge.width = 0.5,
     main = "Wizualizacja grafu Barabási-Albert")

# 4.
best_central <- which.max(betweenness(g))
cat("Najbardziej centralny węzeł: ", best_central, "\n\n")

# 5.
g_diameter <- diameter(g)
cat("Średnica: ", g_diameter, "\n\n")

# Różnica między grafami Barbasi-Albert i Erdos-Renyi polega na tym, że
# w przypadku modelu Edros-Reneyi każda krawędź powstaje niezależnie z zadanym 
# prawdopodobieństwem, natomiast w modelu Barbasi-Albert nowe węzły częściej łączą się
# z węzłami o dużym stopniu.
# W efekcie model Erdos-Renyi generuje grafy bardziej jednolite, a
# model Barbasi-Albert ma wyraźną strukturę