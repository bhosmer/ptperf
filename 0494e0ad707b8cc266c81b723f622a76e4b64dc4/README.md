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
16.845382844097912

pointwise_inplace
15.819326802156866

pointwise_outplace
8.886627214029431

empty
12.271386335603893

contig
9.839609067887068
