SOURCE_DIR=`mktemp -d`
VENV_DIR=/opt/lafswww
VENV=${SOURCE_DIR}${VENV_DIR}
VERSION=0.0.1
ITERATION=1
PKG_NAME=lafswww
BINDIR=$SOURCE_DIR/usr/local/bin

mkdir -p $VENV
mkdir -p $BINDIR

virtualenv --distribute --no-site-packages $VENV
$VENV/bin/pip install commandr fs

sed "s,@@VENV@@,$VENV_DIR,g" $PKG_NAME > $BINDIR/$PKG_NAME
chmod +x $BINDIR/$PKG_NAME

cp ${PKG_NAME}.py $VENV/bin/$PKG_NAME

fpm --force -C $SOURCE_DIR --deb-user root --deb-group root --iteration $ITERATION -d python -s dir -t deb -n $PKG_NAME -a native --version $VERSION .

rm -rf $SOURCE_DIR
