commit 87d7c362b1617d5a7ab72c3c27b4bb11e3371145
Author: Meghan Lele <meghanl@fb.com>
Date:   Thu Aug 27 15:31:12 2020 -0700

    [JIT] Add JIT support for torch.no_grad (#41371)
    
    Summary:
    Pull Request resolved: https://github.com/pytorch/pytorch/pull/41371
    
    **Summary**
    This commit enables the use of `torch.no_grad()` in a with item of a
    with statement within JIT. Note that the use of this context manager as
    a decorator is not supported.
    
    **Test Plan**
    This commit adds a test case to the existing with statements tests for
    `torch.no_grad()`.
    
    **Fixes**
    This commit fixes #40259.
    
    Test Plan: Imported from OSS
    
    Reviewed By: gmagogsfm
    
    Differential Revision: D22649519
    
    Pulled By: SplitInfinity
    
    fbshipit-source-id: 7fa675d04835377666dfd0ca4e6bc393dc541ab9

---

pointwise_functional
23.593070566654205

pointwise_inplace
8.979347871616483

pointwise_outplace
10.17864303663373

empty
10.409920351579785

contig
9.730009129270911
