adj_cube <- ironmarch:::.im_adacency_cube()

apply(adj_cube, 3, function(.x) sum(.x == 10))
##> y2011  y2012  y2013  y2014  y2015  y2016  y2017 
##> 671640 641280 603816 558441 466105 256725      0 
apply(adj_cube, 3, function(.x) mean(.x == 10))
##> y2011     y2012     y2013     y2014     y2015     y2016     y2017 
##> 0.9964379 0.9513961 0.8958149 0.8284971 0.6915084 0.3808745 0.0000000 

readr::write_rds(adj_cube, "playground/siena/adj-cube-slices/adj_cube.rds",
                 compress = "gz")

slices <- lapply(seq_len(dim(adj_cube)[[3L]]), function(.x) adj_cube[,,.x])
names(slices) <- dimnames(adj_cube)[[3]]

for (i in seq_along(slices)) {
  to_write <- tibble::as_tibble(
    tibble::rownames_to_column(as.data.frame(slices[[i]]))
  )
  readr::write_csv(
    to_write, 
    path = sprintf("playground/siena/adj-cube-slices/%s.csv", names(slices)[[i]])
  )
}


geo_dists <- tibble::as_tibble(
  tibble::rownames_to_column(
    as.data.frame(
      ironmarch:::im_geodist_matrix()
    )
  )
)
readr::write_csv(geo_dists, "playground/siena/covariates/geodist_matrix.csv")


same_member_group_id_mat <- tibble::as_tibble(
  tibble::rownames_to_column(
    as.data.frame(
      ironmarch:::im_same_member_group_id_mat()
    )
  )
)
readr::write_csv(same_member_group_id_mat,
                 "playground/siena/covariates/same_member_group_id_matrix.csv")
