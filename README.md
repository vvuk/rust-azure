# rust-azure

[Documentation](http://doc.servo.org/azure/)

## Updating from m-c moz2d

* strip mozilla/gfx include dirs: `for f in `grep -rl 'mozilla/gfx' -r .`; do sed 's,mozilla/gfx/,,' < $f > foo; mv foo $f; done`
* strip skia include dirs: `for f in `grep -rl 'skia/include' -r .`; do sed 's,skia/include/\(effects\|core\|ports\|gpu\)/,,' < $f > foo; mv foo $f; done`
* strip GenericRefCounted.h mozilla/ prefix include dir in 2D.h
