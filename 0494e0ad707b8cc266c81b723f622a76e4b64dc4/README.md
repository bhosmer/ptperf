commit 0494e0ad707b8cc266c81b723f622a76e4b64dc4
Author: Sebastian Messmer <messmer@fb.com>
Date:   Fri Jun 26 12:54:31 2020 -0700

    Back out "Revert D21581908: Move TensorOptions ops to c10" (#40595)

    Summary:
    Pull Request resolved: https://github.com/pytorch/pytorch/pull/40595

    ghstack-source-id: 106691774

    Test Plan: waitforsandcastle

    Differential Revision: D22247729

    fbshipit-source-id: 14745588cae267c1e0cc51cd9541a9b8abb830e5

---

pointwise_functional
15.871129758656025

pointwise_inplace
7.410875303670764

pointwise_outplace
9.28882075380534

empty
14.849035015329719

contig
9.609856901690364
