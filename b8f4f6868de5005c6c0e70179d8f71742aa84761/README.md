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
14.604621652513742

pointwise_inplace
14.651750605553389

pointwise_outplace
9.085255844518542

empty
9.411703032441437

contig
9.689255852252245
