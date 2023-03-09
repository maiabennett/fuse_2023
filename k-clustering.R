
unpaired_direct = read.xlsx("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/killing_data.xlsx", "direct", row.names = TRUE)
unpaired_n_direct = read.xlsx("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/killing_data.xlsx", "norm_direct", row.names = TRUE)
unpaired_ADCC = read.xlsx("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/killing_data.xlsx", "ADCC", row.names = TRUE)
unpaired_n_ADCC = read.xlsx("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/killing_data.xlsx", "norm_ADCC", row.names = TRUE)
paired = read.xlsx("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/killing_data.xlsx", "paired", row.names = TRUE)
paired_n = read.xlsx("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/killing_data.xlsx", "norm_paired", row.names = TRUE)


# Unpaired direct data
# Unpaired normalized direct data in 2 and 3 clusters
set.seed(30)
km.u.n.d.res <- kmeans(unpaired_n_direct, 2, nstart = 25)
print(km.u.n.d.res)
km.u.n.d.3.res <- kmeans(unpaired_n_direct, 3, nstart = 25)
print(km.u.n.d.3.res)

# Unpaired ADCC data
# Unpaired normalized ADCC data
set.seed(30)
km.u.n.a.res <- kmeans(unpaired_n_ADCC, 2, nstart = 25)
print(km.u.n.a.res)
km.u.n.a.3.res <- kmeans(unpaired_n_ADCC, 3, nstart = 25)
print(km.u.n.a.3.res)

# Paired data
# Paired normalized data
set.seed(30)
km.p.n.res <- kmeans(paired_n, 2, nstart = 25)
print(km.p.n.res)
png("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Clusters/paired_2_clusters.png")
fviz_cluster(object = km.p.n.res, data = paired_n, geom = "point")
dev.off()
km.p.n.3.res <- kmeans(paired_n, 3, nstart = 25)
print(km.p.n.3.res)
png("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Clusters/paired_3_clusters.png")
fviz_cluster(object = km.p.n.3.res, data = paired_n, geom = "point")
dev.off()
