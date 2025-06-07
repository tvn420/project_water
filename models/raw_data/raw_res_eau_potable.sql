select 

cond_id,
cond_classe_precision,
COALESCE(cond_diametre,'0') AS cond_diametre,
cond_type,
cond_enrobage,
cond_materiau,
coordinates,
geojson,
COALESCE(cond_annee_pose,1900) AS cond_annee_pose

from 
{{ source("default","reseau_deau_potable_conduite") }}