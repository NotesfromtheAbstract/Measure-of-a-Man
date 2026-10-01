# Measure of a Man

Data and R code behind the charts in ["Measure of a Man"](https://notesfromtheabstract.com), a piece on how testosterone prescribing in the US skips the confirmatory second draw the diagnostic guidelines require.

## What's here

- `data/` — the two small datasets behind the charts, pulled from the cited studies
- `R/` — one script per chart (three charts), each reads its CSV and writes a PNG to `charts/`
- `charts/` — the rendered PNGs used in the post

## The charts

**`chart1_headline.png`** — Even at an academic medical center, 88% of men started on testosterone at University of Michigan Medicine (2020-2025) did not get the full guideline-concordant workup: two morning draws, LH and/or FSH, no contraindications. Source: Sinha et al., presented at ENDO 2026 (Endocrine Society annual meeting), retrospective chart review of 200 men.

**`chart2_specialty.png`** — Breaks the failure down by specialty, looking at a narrower question: did anyone even order the second confirmatory draw. Urology skipped it least often (45.5%) and HIV medicine most often (88.0%), with endocrinology at 58.1% and primary care at 77.5% (p = .012 across specialties). Source: Khandwala YS, Raheem OA, Ali MA, Hsieh TC. "Variation in Practice Pattern of Male Hypogonadism: A Comparative Analysis of Primary Care, Urology, Endocrinology, and HIV Specialists." *Am J Mens Health.* 2018. DOI: [10.1177/1557988317743152](https://doi.org/10.1177/1557988317743152).

**`chart3_erythrocytosis.png`** — Share of men whose hematocrit rose above 50% over three years of testosterone therapy, by formulation: injections 66.7% (38 of 57), pellets 35.1% (26 of 74), gel 12.8% (6 of 47). Source: Pastuszak AW, Gomez LP, Scovell JM, Khera M, Lamb DJ, Lipshultz LI. "Comparison of the Effects of Testosterone Gels, Injections, and Pellets on Serum Hormones, Erythrocytosis, Lipids, and Prostate-Specific Antigen." *Sex Med.* 2015. DOI: [10.1002/sm2.76](https://doi.org/10.1002/sm2.76). Small groups from a single study.

Note: charts 1 and 2 come from two independent studies with two different patient cohorts and two differently defined outcome measures (full guideline concordance vs. the narrower repeat-confirmatory-test question). They converge on the same underlying problem, but they aren't the same number measured twice. Chart 3 covers a separate question, side effects by formulation.

## Running it

```r
install.packages("ggplot2")
```

Then, from the repo root:

```r
source("R/chart1_headline.R")
source("R/chart2_specialty.R")
source("R/chart3_erythrocytosis.R")
```

Each script reads its CSV from `data/` and writes a PNG to `charts/`, overwriting what's there.

## Full references

1. Bhasin S, Brito JP, Cunningham GR, et al. Testosterone Therapy in Men With Hypogonadism: An Endocrine Society Clinical Practice Guideline. *J Clin Endocrinol Metab.* 2018;103(5):1715-1744.
2. Mulhall JP, Trost LW, Brannigan RE, et al. Evaluation and Management of Testosterone Deficiency: AUA Guideline. *J Urol.* 2018;200(2):423-432.
3. Pederson PE, Winkelman J, Wong M, Puglisi L, Levine MJ. Assessing Adherence to Guideline-Based Diagnosis and Treatment of Male Hypogonadism in the Age of Direct-to-Consumer Advertising. *J Endocr Soc.* 2025;9(Suppl 1):bvaf149.1952. Presented at ENDO 2025.
4. Centers for Medicare and Medicaid Services. Clinical Laboratory Fee Schedule, CPT 84403 (Testosterone, Total).
5. Sinha S, Papaleontiou M, et al. Testosterone Therapy in Men May Be Overprescribed, Inconsistent With Clinical Guidelines. Presented at ENDO 2026 (Endocrine Society Annual Meeting), June 2026. University of Michigan Medicine chart review, 200 patients, 2020-2025.
6. Khandwala YS, Raheem OA, Ali MA, Hsieh TC. Variation in Practice Pattern of Male Hypogonadism: A Comparative Analysis of Primary Care, Urology, Endocrinology, and HIV Specialists. *Am J Mens Health.* 2018. DOI: 10.1177/1557988317743152.
7. Lincoff AM, Bhasin S, Flevaris P, et al. Cardiovascular Safety of Testosterone-Replacement Therapy. *N Engl J Med.* 2023;389(2):107-117.
8. US Food and Drug Administration. FDA Issues Class-Wide Labeling Changes for Testosterone Products. February 28, 2025.
9. FDA-approved prescribing information: Depo-Testosterone, Xyosted, Aveed, AndroGel.
10. Pastuszak AW, Gomez LP, Scovell JM, Khera M, Lamb DJ, Lipshultz LI. *Sex Med.* 2015. DOI: 10.1002/sm2.76.
11. Punjani N, Bernie H, Salter C, et al. *Sex Med.* 2021;9(4):100378.
12. Rochon PA, Gurwitz JH. The prescribing cascade. *BMJ.* 1997;315:1096-1099.

## License

Code (`R/`) is MIT. Data (`data/`) is derived from the cited studies; consult those papers before reuse.
