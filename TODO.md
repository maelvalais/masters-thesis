
* [x] introduce why we need sparse representations
* [ ] give an example with astrophysics/space imaging
* [ ] also give example of machine learning example
* [ ] tell what is the problem with current algorithms
* [ ] explain how we think we will fix that

* [x] introduce with basis like  --DCT-- fourier transform/dictionary
* [x] why it is better to learn a dictionary
* [ ] the actual techniques for finding a dictionary
* [ ] introduce the K-SVD algorithm (for future reference: it means
  we'll compare our algorithm to ksvd!)
* [ ] ksvd gives state of the art results
* [ ] but not so good for multi-resolution representation and machine
  learning
* [ ] tell that we are currently only focusing on the dictionary
  update step; we name that problem (FTL)
* [ ]FTL aims at min ||Dx-y||^2 but the "real" dictionary learning problem
  is lamb||x|| + ||Dx-y||^2
* [ ] We solve FTL by using PALMTREE
* [ ] Present PALMTREE
* [ ] gauss-seidel on blocs of variables which is
    x_i = argmin E(x_i, y_fixed)


* [ ] I want to make the support finding a part of the whole
  optimization process
* [ ] what points should I add?
* [ ] introduce omp and l1 regularization (sparse coding)


* [ ] expliquer en quoi était 
- gain par point ajouté, per-added-point gain
- single step obj gain

- essayer avec des cosinus
- essayer avec un arbre de curvelets

- comparer les max des grad des différents h^e

Réunion 1er juillet 2016
========================

- [ ] Expérience 1: 
- [ ] Expérience 2:
- [ ] Parler de la parcimonie
- [ ] Parler du problème du gradient (=vision locale) vs le "point objectif" (
  un point ajouté qui aura finalement une meilleure fonc. obj.)

