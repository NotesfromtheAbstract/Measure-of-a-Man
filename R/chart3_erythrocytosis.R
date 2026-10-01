# chart3_erythrocytosis.R
#
# "Blood Thickened Most Often on Injections"
#
# Source: Pastuszak AW, Gomez LP, Scovell JM, Khera M, Lamb DJ, Lipshultz LI.
# Comparison of the Effects of Testosterone Gels, Injections, and Pellets on
# Serum Hormones, Erythrocytosis, Lipids, and Prostate-Specific Antigen.
# Sex Med. 2015. DOI: 10.1002/sm2.76
# 178 men followed for three years (47 gel, 74 pellets, 57 injections).
# Erythrocytosis = hematocrit above 50%. Difference across groups P < 0.0001.
#
# Reproduces charts/chart3_erythrocytosis.png

library(ggplot2)

bg <- "#faf3e9"
ink <- "#1a1a1a"
subtitle_gray <- "#3a3a3a"
source_gray <- "#8a8a8a"
axis_label_gray <- "#6a6a6a"

df <- read.csv("data/chart3_erythrocytosis.csv", stringsAsFactors = FALSE)

# Order from lowest to highest rate (top to bottom on the chart)
df$formulation <- factor(df$formulation,
  levels = rev(c("Gel", "Pellets", "Injections")))

df$fill_color <- ifelse(df$formulation == "Injections", "#b8472f",
                         ifelse(df$formulation == "Gel", "#3d6d95", "#8c8377"))
df$label <- sprintf("%.1f%%  (%d of %d men)", df$percent,
                    df$men_with_hct_over_50, df$n)

p <- ggplot(df, aes(x = formulation, y = percent)) +
  geom_col(aes(fill = fill_color), color = "#2a2a2a", linewidth = 0.6, width = 0.62) +
  geom_text(aes(label = label, y = percent + 2),
            hjust = 0, fontface = "bold", size = 5.6, color = ink) +
  scale_fill_identity() +
  scale_y_continuous(limits = c(0, 100), expand = c(0, 0)) +
  coord_flip(clip = "off") +
  labs(
    title = "Blood Thickened Most Often\non Injections",
    subtitle = paste0(
      "Share of men whose hematocrit rose above 50% during three years of\n",
      "testosterone therapy, by how the drug was delivered."
    ),
    caption = paste0(
      "Source: Pastuszak et al., Sexual Medicine, 2015. 178 men followed for three years\n",
      "(47 gel, 74 pellets, 57 injections). Erythrocytosis defined as hematocrit above 50%.\n",
      "Small groups from a single study."
    )
  ) +
  annotate("text", x = 3.7, y = 50,
           label = "Share of men with erythrocytosis",
           color = axis_label_gray, size = 3.6, fontface = "italic") +
  theme_void(base_size = 14) +
  theme(
    plot.background = element_rect(fill = bg, color = NA),
    panel.background = element_rect(fill = bg, color = NA),
    legend.position = "none",
    axis.text.y = element_text(color = ink, size = 13, hjust = 1, margin = margin(r = 8)),
    plot.title = element_text(color = ink, face = "bold", size = 22, hjust = 0,
                               margin = margin(b = 10), lineheight = 1.05),
    plot.subtitle = element_text(color = subtitle_gray, size = 13, hjust = 0,
                                  margin = margin(b = 24), lineheight = 1.3),
    plot.caption = element_text(color = source_gray, size = 8.5, hjust = 0,
                                 margin = margin(t = 30), lineheight = 1.4),
    plot.margin = margin(t = 30, r = 90, b = 20, l = 30)
  )

ggsave("charts/chart3_erythrocytosis.png", p, width = 14.56, height = 9.28,
       dpi = 100, bg = bg)
