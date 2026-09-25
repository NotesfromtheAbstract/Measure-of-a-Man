# chart1_headline.R
#
# "Even at an Academic Medical Center, 88% Skipped the Standard"
#
# Source: Sinha et al., presented at ENDO 2026 (Endocrine Society annual
# meeting), retrospective chart review of 200 men prescribed testosterone
# at University of Michigan Medicine, 2020-2025. "Guideline-concordant" =
# two morning total/free/bioavailable testosterone draws (5-10am), LH
# and/or FSH measured, and no contraindications present.
#
# Reproduces charts/chart1_headline.png

library(ggplot2)

bg <- "#faf3e9"
bar_gray <- "#8c8377"
bar_red <- "#b8472f"
ink <- "#1a1a1a"
subtitle_gray <- "#3a3a3a"
source_gray <- "#8a8a8a"

df <- read.csv("data/chart1_headline.csv", stringsAsFactors = FALSE)
df$category <- factor(df$category, levels = c("Did not meet the standard", "Met it"))
df$xmin <- c(0, df$percent[1])
df$xmax <- c(df$percent[1], 100)
df$xmid <- (df$xmin + df$xmax) / 2
df$fill <- c(bar_gray, bar_red)
df$label <- c("88%\ndid not meet the standard", "12%\nmet it")

p <- ggplot(df) +
  geom_rect(aes(xmin = xmin, xmax = xmax, ymin = 0.42, ymax = 0.58, fill = category),
            color = "#2a2a2a", linewidth = 0.6) +
  geom_text(aes(x = xmid, y = 0.5, label = label),
            color = "white", fontface = "bold", size = 6.2, lineheight = 0.95) +
  scale_fill_manual(values = setNames(df$fill, df$category)) +
  coord_cartesian(xlim = c(0, 100), ylim = c(0, 1), expand = FALSE) +
  labs(
    title = "Even at an Academic Medical Center,\n88% Skipped the Standard",
    subtitle = paste0(
      "Share of men prescribed testosterone at Michigan Medicine who received\n",
      "the full guideline-concordant diagnostic workup before starting."
    ),
    caption = paste0(
      "Source: Sinha et al., presented at ENDO 2026 (Endocrine Society annual meeting), retrospective chart\n",
      "review of 200 men prescribed testosterone at University of Michigan Medicine, 2020-2025.\n",
      "\"Guideline-concordant\" = two morning total/free/bioavailable testosterone draws (5-10am),\n",
      "LH and/or FSH measured, and no contraindications present."
    )
  ) +
  theme_void(base_size = 14) +
  theme(
    plot.background = element_rect(fill = bg, color = NA),
    panel.background = element_rect(fill = bg, color = NA),
    legend.position = "none",
    plot.title = element_text(color = ink, face = "bold", size = 22, hjust = 0,
                               margin = margin(b = 10), lineheight = 1.05),
    plot.subtitle = element_text(color = subtitle_gray, size = 13, hjust = 0,
                                  margin = margin(b = 18), lineheight = 1.3),
    plot.caption = element_text(color = source_gray, size = 8.5, hjust = 0,
                                 margin = margin(t = 18), lineheight = 1.4),
    plot.margin = margin(t = 30, r = 30, b = 20, l = 30)
  )

ggsave("charts/chart1_headline.png", p, width = 14.56, height = 9.28,
       dpi = 100, bg = bg)
