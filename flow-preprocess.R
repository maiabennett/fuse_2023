# Load FlowJo compensation matrix
comp <- read.csv("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/CompData/comp_matrix.csv", check.names = FALSE, row.names = 1)
colnames(comp) <- sub(" :: .*", "", colnames(comp))


dir_untreated <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/"
dir_u_qc <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/qc/"
dir_u_prep <-"C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/preprocessed/"
dir_u_rds <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/rds/"
dir_u_res <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/results/"
dir_treated <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Treated/"
dir_t_qc <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Treated/qc/"
dir_t_prep <-"C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Treated/preprocessed/"
dir_t_rds <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Treated/rds/"
dir_t_res <- "C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Treated/results/"
files_untreated <- list.files(path = dir_untreated, pattern = ".fcs")
files_treated <- list.files(path = dir_treated, pattern = ".fcs")

ff <- read.FCS(paste0(dir_untreated, files_untreated[2]), truncate_max_range = FALSE)
markers <-c("CD56 APC-A", "CD16 PB450-A", "NKG2A PE-A", "NKG2D APC-A750-A", "CD57 PE-Cy7-A", "NKp46 KO525-A")
channels <- GetChannels(object = ff, markers = markers, exact = FALSE)
live_gate <- rectangleGate(filterId = "Live", "FSC-A" = c(1000,2000000), "FL3-A" = c(3000,10000))
NK_gate <- rectangleGate(filterId = "NKs", "FL1-A" = c(-1000,1000), "FL5-A" = c(4000,1000000))

# Any arbitrary reference for pre-filtering checks
ff_m <- RemoveMargins(ff, channels)
ff_c <- compensate(ff_m, comp)
#translist <- estimateLogicle(ff_c, colnames(comp))
#ff_t <- flowCore::transform(ff_c, translist)
ff_s <- RemoveDoublets(ff_c)
live <- filter(ff_s, live_gate)
ff_l <- ff_s[live@subSet, ]
NKs <- filter(ff_l, NK_gate)
ff_nk <- ff_l[NKs@subSet, ]

# A visual check on the dead/debris discrimination (before/after)
ggcyto::autoplot(ff_s, "PC5.5-A", "FSC-A")
ggcyto::autoplot(ff_l, "PC5.5-A", "FSC-A")

# A visual check on the NK gate (before/after)
ggcyto::autoplot(ff_l, "APC-A", "FITC-A")
ggcyto::autoplot(ff_nk, "APC-A", "FITC-A")


# Untreated data
for (file in files_untreated[1:9]){
  ff <- read.FCS(paste0(dir_untreated, file), truncate_max_range = FALSE)
  ff_c <- compensate(ff, comp)
  ff_s <- RemoveDoublets(ff_c)
  live <- filter(ff_s, live_gate)
  ff_l <- ff_s[live@subSet, ]
  NKs <- filter(ff_l, NK_gate)
  ff_nk <- ff_l[NKs@subSet, ]
  
  write.FCS(ff_nk,
            file = paste0(dir_u_prep, file))
}
# Treated data
for (file in files_treated[1:9]){
  ff <- read.FCS(paste0(dir_treated, file), truncate_max_range = FALSE)
  ff_c <- flowCore::compensate(ff, comp)
  ff_s <- PeacoQC::RemoveDoublets(ff_c)
  live <- filter(ff_s, live_gate)
  ff_l <- ff_s[live@subSet, ]
  NKs <- filter(ff_l, NK_gate)
  ff_nk <- ff_l[NKs@subSet, ]
  
  write.FCS(ff_nk,
            file = paste0(dir_t_prep, file))
}
