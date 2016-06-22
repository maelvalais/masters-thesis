The names are to be understood as:

    xp_128x128_sc2_angl1_K3_S3_node3_gradient_node_3.png
    ^  ^^^^^^^   ^     ^  ^  ^     ^               ^
    1     2      3     4  5  6     7               8


1) The name of the experiment. To shorten the file names, I decided to name
the "add-pt_support_bruteforce" experiment "xp".
2) The size of the target image (and also the size of the kernels)
3) sc (=scale) is a parameter for creating the curvelet atom which serves as
the target image
4) angl (=angle) is also a parameter for creating the curvelet
5) it is also a parameter for creating the curvelet; K = level of
decomposition
6) S is the size of the support; S=3 will give 3*3 supports
7) each file is focusing on the adding of points to one of the kernel
support. For example, here, we added the point to the support no. 3.
   -> 1 means the root of the 4-edges single-branch tree, 4 means the leaf. 
8) same as above but indicates on what kernel is based the partial gradient

