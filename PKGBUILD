pkgname=diva
pkgver=0.1
pkgrel=1
arch=('any')

pkgdesc='Dependency injection library for vala/glib'
depends=("${MINGW_PACKAGE_PREFIX}-libgee")

build() {
    cd ..
    meson build
    cd build
	ninja
}

package() {
    cd ../build
	PREFIX=${pkgdir} ninja install
}
