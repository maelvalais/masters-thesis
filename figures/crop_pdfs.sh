#
# Makefile
# Maël Valais, 2016-08-05 15:02
#

DIRS="before_after
exple-better-support
variable_support
verif_gradient
xp
xp_grad_iterations"
for d in ${DIRS}; do
    find -path "*/$d/*" -name "*.pdf" -exec echo {} \;
done


# vim:ft=make
#
