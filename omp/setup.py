import os
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext


ext_modules=[
    Extension("omp_testing",
              ["omp_testing.pyx"],
              libraries=[],
              extra_compile_args=[],
              extra_link_args=['-lomp']
              )
]

setup(
  name="omp_testing",
  cmdclass={"build_ext": build_ext},
  ext_modules=ext_modules
)