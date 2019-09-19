*** |  (C) 2008-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  MAgPIE License Exception, version 1.0 (see LICENSE file).
*** |  Contact: magpie@pik-potsdam.de

*' @equations

  q27_prod_timber(j2,kforestry)..
    vm_prod(j2,kforestry)
    =e=
    sum(timber_source,v27_prod_timber(j2,timber_source,kforestry))
    + vm_prod_heaven_timber(j2,kforestry)
    ;

*' The equation above describes production of a MAgPIE timber commodity `vm_prod_timber`
*' as the cluster level production for `vm_prod` for timber. `vm_prod_timber` can be
*' produced from either highly managed plantation foorests or natural forests.

  q27_prod_timber_forestry(j2,kforestry)..
    v27_prod_timber(j2,"plantations",kforestry)
    =e=
    vm_prod_cell_forestry(j2,kforestry)
    ;

*' The part timber production coming from harvesting of highly managed plantation forests
*' is calculated in [32_forestry] module.

  q27_prod_timber_natveg(j2,kforestry)..
    v27_prod_timber(j2,"natural_forest",kforestry)
    =e=
    vm_prod_cell_natveg(j2,kforestry)
    ;

*' The part timber production coming from harvesting of natural forests is calculated
*' in [35_natveg] module.

**** Woodfuel specific settings

  q27_prod_woodfuel_forestry(i2)..
    sum(cell(i2,j2),vm_prod_cell_forestry(j2,"woodfuel"))
    =l=
    sum(cell(i2,j2),vm_prod(j2,"woodfuel")) * 0.20
    ;

*' The part timber production coming from harvesting of highly managed plantation forests
*' is calculated in [32_forestry] module.

*** EOF constraints.gms ***
