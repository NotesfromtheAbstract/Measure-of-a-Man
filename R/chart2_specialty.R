# chart2_specialty.R
#
# "No Specialty Came Close to Fixing It"
#
# Source: Khandwala et al., independent retrospective chart review of 193
# men diagnosed with hypogonadism (50 urology, 49 primary care, 44
# endocrinology, 50 HIV medicine); p < .001. "Repeat confirmatory test" -
# a second low morning testosterone reading before starting treatment -
# is a narrower, differently defined metric than the full workup shown
# in the companion chart, from a separate patient cohort.
#
# Reproduces charts/chart2_specialty.png

library(ggplot2)

bg <- "#faf3e9"
ink <- "#1a1a1a"
subtitle_gray <- "#3a3a3a"
source_gray <- "#8a8a8a"
axis_label_gray <- "#6a6a6a"

df <- read.csv("data/chart2_specialty.csv", stringsAsFactors = FALSE)

# Order from best- to worst-performing (top to bottom on the chart)
df$specialty <- factor(df$specialty,
  levels = rev(c("Urology", "Endocrinology", "Primary care", "HIV medicine")))

df$fill_color <- ifelse(df$specialty %in% c("Primary care", "HIV medicine"),
                         "#b8472f",
                         ifelse(df$specialty == "Urology", "#3d6d95", "#8c8377"))

p <- ggplot(df, aes(x = specialty, y = percent_without_confirmatory_test)) +
  geom_col(aes(fill = fill_color), color = "#2a2a2a", linewidth = 0.6, width = 0.62) +
  geom_text(aes(label = paste0(percent_without_confirmatory_test, "%"),
                y = percent_without_confirmatory_test + 3),
            hjust = 0, fontface = "bold", size = 6.2, color = ink) +
  scale_fill_identity() +
  scale_y_continuous(limits = c(0, 100), expand = c(0, 0)) +
  coord_flip(clip = "off") +
  labs(
    title = "No Specialty Came Close\nto Fixing It",
    subtitle = paste0(
      "In an independent study, primary care skipped the repeat confirmatory test\n",
      "most often, but even the best-performing specialty still missed it on\n",
      "nearly half its patients."
    ),
    caption = paste0(
      "Source: Khandwala et al., independent retrospective chart review of 193 men diagnosed with hypogonadism\n",
      "(50 urology, 49 primary care, 44 endocrinology, 50 HIV medicine); p < .001. \"Repeat confirmatory test\"\n",
      "- a second low morning testosterone reading before starting treatment - is a narrower, differently\n",
      "defined metric than the full workup shown in the companion chart, from a separate patient cohort."
    )
  ) +
  annotate("text", x = 4.7, y = 50,
           label = "Share of patients started on testosterone WITHOUT a repeat confirmatory test",
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
    plot.margin = margin(t = 30, r = 40, b = 20, l = 30)
  )

ggsave("charts/chart2_specialty.png", p, width = 14.56, height = 9.28,
       dpi = 100, bg = bg)
