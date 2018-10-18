# Socioecological similarity predicts the global biogeography of infectious disease in humans

The goal of this project is to come up with a reasonable way to predict pathogen sharing patterns between countries, using the DAME (dynamic additive and multiplicative effects model) for dyadic networks.

This follows on two previous preprints: 
1. Poisot, T., Nunn, C., & Morand, S. (2014). Ongoing worldwide homogenization of human pathogens. [bioRxiv, 009977.](https://www.biorxiv.org/content/early/2014/10/03/009977.article-info)
2. Dallas, T. A., Carlson, C. J., & Poisot, T. (2018). Leveraging pathogen community distributions to understand outbreak and emergence potential. [bioRxiv, 336065.](https://www.biorxiv.org/content/early/2018/08/03/336065)

The GIDEON data is available as a list of countries, years, and pathogens. The goal is currently to come up with appropriate dyadic predictors for pairs of countries. So far there are three categories that broadly include a few different ideas, which draw on a few specific data sources very heavily:

- GBIF (www.gbif.org): for animal occurrence data
- CEPII [GeoDist](http://www.cepii.fr/PDF_PUB/wp/2011/wp2011-25.pdf) Database


### Geographic predictors

1. Geographic distance between countries: several options available in GeoDist
- dist: distance between most important cities
- distcap: distance between capital cities
- distw: distance weighted by population (gravity model)
- distwces: distance weighted by population (gravity model, usually used for bilateral trade flow)

2. Contiguity between countries (shared border)
- \texttt{contig} in GeoDist (a binary variable)

3. Shared continent 
- can be derived from \texttt{continent} in GeoDist

### Social predictors

1. Shared language

2. Shared colonial history

3. Traveler data

4. Trade data?

### Ecological predictors

1. Dissimilarity in wildlife community

2. Dissimilarity in vector community

3. Climatic dissimilarity
