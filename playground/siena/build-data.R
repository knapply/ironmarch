adj_cube <- ironmarch:::.im_adacency_cube()

apply(adj_cube, 3, function(.x) sum(.x == 10))
# y2011     y2012     y2013     y2014     y2015     y2016     y2017 
# 0.9986811 0.9781374 0.9430457 0.9031022 0.7950999 0.5319027 0.0000000 
apply(adj_cube, 3, function(.x) mean(.x == 10))
# y2011     y2012     y2013     y2014     y2015     y2016     y2017 
# 0.9986811 0.9781374 0.9430457 0.9031022 0.7950999 0.5319027 0.0000000 

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


geo_dists <- ironmarch:::im_geodist_matrix()

geo_dist_df <- tibble::as_tibble(
  tibble::rownames_to_column(
    as.data.frame(
      geo_dists
    )
  )
)
readr::write_csv(geo_dist_df, "playground/siena/covariates/geodist_matrix.csv")

readr::write_rds(geo_dists, "playground/siena/covariates/geodist_matrix.rds",
                 compress = "gz")


same_member_group_id_mat <- ironmarch:::im_same_member_group_id_mat()

same_member_group_id_df <- tibble::as_tibble(
  tibble::rownames_to_column(
    as.data.frame(
      same_member_group_id_mat
    )
  )
)
readr::write_csv(same_member_group_id_df,
                 "playground/siena/covariates/same_member_group_id_matrix.csv")
readr::write_rds(same_member_group_id_mat,
                 "playground/siena/covariates/same_member_group_id_matrix.rds")
