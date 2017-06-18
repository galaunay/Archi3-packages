rm archi3reporepo.db
rm archi3repo.files
rm archi3repo.db.tar.gz
rm archi3repo.files.tar.gz
repo-add archi3repo.db.tar.gz *.pkg.tar.xz
rm archi3repo.db
rm archi3repo.files
cp archi3repo.db.tar.gz archi3repo.db
cp archi3repo.files.tar.gz archi3repo.files
