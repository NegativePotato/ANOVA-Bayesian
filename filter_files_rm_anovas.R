library(dplyr)

rm_anova_data_raw.df <- read.csv(file.path("Data", "2026_02_20_36p_Castellar_stimlocked_mean-amplitude_each-invid-block_allchannels_350750.csv"))
rm_anova_data.df <- rm_anova_data_raw.df %>% 
  filter(condition %in% c('high_flow', "low_flow"), 
         ch_name %in% c('Fz', 'Pz'), 
         stim == "target") 

rm_anova_data_wide.df <- rm_anova_data.df %>% 
  tidyr::pivot_wider(names_from = c(condition, ch_name), 
                     values_from = mean_amp, 
                     names_prefix = "amp_", 
                     names_sep = "_")

write.csv(x = rm_anova_data_wide.df, 
          file = file.path("Data", "2026_02_20_36p_Castellar_stimlocked_mean-amplitude_each-invid-block_allchannels_350750_RM-ANOVA.csv"))
