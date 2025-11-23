library(igraph)

# 2.
g <- erdos.renyi.game(n = 100, p = 0.05, directed = FALSE)

# 3. Podsumowanie
cat("Podsumowanie grafu\n\n")
print(summary(g))
cat("Ważony = ", is_weighted(g), "\n\n")

# 4. Wierzchołki
cat("Wierzchołki\n\n")
print(V(g))
cat("\n\n")

# 4. Krawędzie
cat("Krawędzie\n\n")
print(E(g))
cat("\n\n")

# 5.
E(g)$weight <- runif(ecount(g), min = 0.01, max = 1)

# 6. Podsumowanie z wagami
cat("Podsumowanie z dodanymi wagami\n\n")
print(summary(g))
cat("Ważony = ", is_weighted(g), "\n\n")

# 7.
cat("Stopnie węzłów\n\n")
degrees <- degree(g)
cat(degrees, "\n\n")


hist(degrees, main = "Histogram stopni węzłów",
     xlab = "Stopień węzła", ylab = "Liczba węzłów",
     col = "#0099bb", border = "black",)

# 8. Klastry
clusters <- components(g)
cat("Klastry\n\n")
cat("Liczba klastrów:", clusters$no)
cat("Rozmiary klastrów:", clusters$csize, "\n\n")

# 9. Wizualizacja
pagerank_scores <- page_rank(g)$vector
v_size <- pagerank_scores * 1000

plot(g,
     vertex.size = v_size,
     vertex.label = NA,
     vertex.color = "lightblue",
     vertex.frame.color = "darkblue",
     edge.color = "gray70",
     edge.width = 0.5,
     layout = layout_with_fr(g),
     main = "Wizualizacja grafu Erdős-Rényi")