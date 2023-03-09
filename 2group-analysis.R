
# Untreated-direct killing comparison
percentages <-GetFeatures(fsom = fsom_untreated,
                            files = paste0(dir_u_prep, files_untreated),
                            type = "percentages")
                            
# Assigning donors to their group is currently a manual process; needs automation in further work
groups.ud <- list("Low-killing" = paste0(dir_u_prep, files_untreated[2:6]),
                  "High-killing" = paste0(dir_u_prep, files_untreated[7:9]))
MC_stats.ud <- GroupStats(percentages[["metacluster_percentages"]], groups.ud)
C_stats.ud <- GroupStats(percentages[["cluster_percentages"]], groups.ud)
fold_changes.ud <- C_stats.ud["fold changes", ]
fold_changes.ud <- factor(ifelse(fold_changes.ud < -1, "Underrepresented compared to low killing group",
                                 ifelse(fold_changes.ud > 1, "Overrepresented compared to low killing group",
                                        "--")), levels = c("--", "Underrepresented compared to low killing group",
                                                           "Overrepresented compared to low killing group"))
fold_changes.ud[is.na(fold_changes.ud)] <- "--"
sbs.ud.low <- PlotStars(fsom_untreated, title = "Low killing donors",
                      nodeSizes = C_stats.ud["medians Low-killing", ],
                      refNodeSize = max(C_stats.ud[c("medians Low-killing", "medians High-killing"),]),
                      backgroundValues = fold_changes.ud,
                      backgroundColors = c("white", "red", "blue"),
                      list_insteadof_ggarrange = TRUE)
sbs.ud.high <- PlotStars(fsom_untreated, title = "High killing donors",
                      nodeSizes = C_stats.ud["medians High-killing", ],
                      refNodeSize = max(C_stats.ud[c("medians Low-killing", "medians High-killing"),]),
                      backgroundValues = fold_changes.ud,
                      backgroundColors = c("white", "red", "blue"),
                      list_insteadof_ggarrange = TRUE)
untreateddirect <- ggpubr::ggarrange(plotlist = list(sbs.ud.low$tree, sbs.ud.high$tree,
                                       sbs.ud.high$starLegend, sbs.ud.high$backgroundLegend),
                       ncol = 2, nrow = 2,
                       heights = c(4, 1))
pdf("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/results/untreated_direct_tree.pdf")
untreateddirect
dev.off()


# Untreated-ADCC killing comparison
groups.ua <- list("Low-killing" = paste0(dir_u_prep, files_untreated[1:7]),
                  "High-killing" = paste0(dir_u_prep, files_untreated[8:9]))
MC_stats.ua <- GroupStats(percentages[["metacluster_percentages"]], groups.ua)
C_stats.ua <- GroupStats(percentages[["cluster_percentages"]], groups.ua)
fold_changes.ua <- C_stats.ua["fold changes", ]
fold_changes.ua <- factor(ifelse(fold_changes.ua < -1, "Underrepresented compared to low killing group",
                                 ifelse(fold_changes.ua > 1, "Overrepresented compared to low killing group",
                                        "--")), levels = c("--", "Underrepresented compared to low killing group",
                                                           "Overrepresented compared to low killing group"))
fold_changes.ua[is.na(fold_changes.ua)] <- "--"
sbs.ua.low <- PlotStars(fsom_untreated, title = "Low killing donors",
                      nodeSizes = C_stats.ua["medians Low-killing", ],
                      refNodeSize = max(C_stats.ua[c("medians Low-killing", "medians High-killing"),]),
                      backgroundValues = fold_changes.ua,
                      backgroundColors = c("white", "red", "blue"),
                      list_insteadof_ggarrange = TRUE)
sbs.ua.high <- PlotStars(fsom_untreated, title = "High killing donors",
                      nodeSizes = C_stats.ua["medians High-killing", ],
                      refNodeSize = max(C_stats.ua[c("medians Low-killing", "medians High-killing"),]),
                      backgroundValues = fold_changes.ua,
                      backgroundColors = c("white", "red", "blue"),
                      list_insteadof_ggarrange = TRUE)
untreatedADCC <- ggpubr::ggarrange(plotlist = list(sbs.ua.low$tree, sbs.ua.high$tree,
                                       sbs.ua.high$starLegend, sbs.ua.high$backgroundLegend),
                       ncol = 2, nrow = 2,
                       heights = c(4, 1))
pdf("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/results/untreated_ADCC_tree.pdf")
untreatedADCC
dev.off()


# Untreated-paired killing comparison
groups.up <- list("Low-killing" = paste0(dir_u_prep, files_untreated[1:7]),
                  "High-killing" = paste0(dir_u_prep, files_untreated[8:9]))
MC_stats.up <- GroupStats(percentages[["metacluster_percentages"]], groups.up)
C_stats.up <- GroupStats(percentages[["cluster_percentages"]], groups.up)
fold_changes.up <- C_stats.up["fold changes", ]
fold_changes.up <- factor(ifelse(fold_changes.up < -2, "Underrepresented compared to low killing group",
                                 ifelse(fold_changes.up > 2, "Overrepresented compared to low killing group",
                                        "--")), levels = c("--", "Underrepresented compared to low killing group",
                                                           "Overrepresented compared to low killing group"))
fold_changes.up[is.na(fold_changes.up)] <- "--"
sbs.up.low <- PlotStars(fsom_untreated, title = "Low killing donors",
                      nodeSizes = C_stats.up["medians Low-killing", ],
                      refNodeSize = max(C_stats.up[c("medians Low-killing", "medians High-killing"),]),
                      backgroundValues = fold_changes.up,
                      backgroundColors = c("white", "red", "blue"),
                      list_insteadof_ggarrange = TRUE)
sbs.up.high <- PlotStars(fsom_untreated, title = "High killing donors",
                      nodeSizes = C_stats.up["medians High-killing", ],
                      refNodeSize = max(C_stats.up[c("medians Low-killing", "medians High-killing"),]),
                      backgroundValues = fold_changes.up,
                      backgroundColors = c("white", "red", "blue"),
                      list_insteadof_ggarrange = TRUE)
untreatedpaired <- ggpubr::ggarrange(plotlist = list(sbs.up.low$tree, sbs.up.high$tree,
                                       sbs.up.high$starLegend, sbs.up.high$backgroundLegend),
                       ncol = 2, nrow = 2,
                       heights = c(4, 1))
pdf("C:/Users/Me/OneDrive - University of Nebraska at Omaha/Administrative/Documents/FUSE 2023/PhenoData/Untreated/results/untreated_paired_tree.pdf")
untreatedpaired
dev.off()
