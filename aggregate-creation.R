
n <- 90000
set.seed(2020)

# Untreated aggregate
agg_untreated <- AggregateFlowFrames(paste0(dir_u_prep, files_untreated),
                                     cTotal = n, writeOutput = TRUE, 
                                     outputFile = paste0(dir_u_prep, "aggregate_untreated.fcs"))
# Untreated FlowSOM object
fsom_untreated <- FlowSOM(input = agg_untreated, colsToUse = channels, scale = TRUE)
saveRDS(fsom_untreated, paste0(dir_u_rds, "fsom_untreated.rds"))
# Untreated FlowSOM visualization
PlotStars(fsom = fsom_untreated,
          backgroundValues = fsom_untreated$metaclustering)
ggsave(paste0(dir_u_res, "fsom_untreated_tree.pdf"),height = 8.5, width = 11)
FlowSOMmary(fsom = fsom_untreated,
            plotFile = paste0(dir_u_res, "fsom_untreated_summary.pdf"))


# Treated aggregate
agg_treated <- AggregateFlowFrames(paste0(dir_t_prep, files_treated),
                                     cTotal = n, writeOutput = TRUE, 
                                     outputFile = paste0(dir_t_prep, "aggregate_treated.fcs"))
# Treated FlowSOM object
fsom_treated <- FlowSOM(input = agg_treated, colsToUse = channels, scale= TRUE)
saveRDS(fsom_treated, paste0(dir_t_rds, "fsom_treated.rds"))
# Treated FlowSOM visualization
PlotStars(fsom = fsom_treated,
          backgroundValues = fsom_treated$metaclustering)
ggsave(paste0(dir_t_res, "fsom_treated_tree.pdf"),height = 8.5, width = 11)
FlowSOMmary(fsom = fsom_treated,
            plotFile = paste0(dir_t_res, "fsom_treated_summary.pdf"))
