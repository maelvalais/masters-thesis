
* [x] introduce why we need sparse representations
* [?] give an example with astrophysics/space imaging
* [ ] also give example of machine learning example
* [ ] tell what is the problem with current algorithms
* [ ] explain how we think we will fix that

* [ ] introduce with basis like DCT transform/dictionary
* [ ] why it is better to learn a dictionary
* [ ] the actual techniques for finding a dictionary
* [ ] introduce the K-SVD algorithm (for future reference: it means
  we'll compare our algorithm to ksvd!)
  - ksvd gives state of the art results
  - but not so good for multi-resolution representation and machine
  learning
* [ ] tell that we are currently only focusing on the dictionary
  update step;
  we name that problem (FTL)
  - FTL aims at min ||Dx-y||^2 but the "real" dictionary learning problem
  is lamb||x|| + ||Dx-y||^2
  - We solve FTL by using PALMTREE
* [ ] Present PALMTREE
  - gauss-seidel on blocs of variables which is
    x_i = argmin E(x_i, y_fixed)


* [ ] I want to make the support finding a part of the whole
  optimization process
* [ ] what points should I add?
* [ ] introduce omp and l1 regularization (sparse coding)

