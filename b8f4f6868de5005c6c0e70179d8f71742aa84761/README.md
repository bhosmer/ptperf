commit b8f4f6868de5005c6c0e70179d8f71742aa84761
Author: Meghan Lele <meghanl@fb.com>
Date:   Fri Jun 26 12:33:53 2020 -0700

    [JIT] Remove dead store in exit_transforms.cpp (#40611)

    Summary:
    Pull Request resolved: https://github.com/pytorch/pytorch/pull/40611

    This commit removes a dead store in `transformWith` of exit_transforms.cpp.

    Test Plan: Continuous integration.

    Reviewed By: suo

    Differential Revision: D22254136

    fbshipit-source-id: f68c4625f7be8ae29b3500303211b2299ce5d6f6

---

pointwise_functional
17.12431149277836

pointwise_inplace
7.405079239048064

pointwise_outplace
9.69378596264869

empty
9.418227666988969

contig
9.575862099416554

---

pointwise_functional
13.933759767562151

pointwise_inplace
7.0429842080920935

pointwise_outplace
14.903623694553971

empty
9.050167789682746

contig
10.40269579924643
