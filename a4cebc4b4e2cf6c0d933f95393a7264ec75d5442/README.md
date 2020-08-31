commit a4cebc4b4e2cf6c0d933f95393a7264ec75d5442
Merge: 62930a94a9 86b2faeb53
Author: Sebastian Messmer <messmer@fb.com>
Date:   Thu Jul 30 11:45:32 2020 -0700

    Update on "Make operators with optional Tensor? arguments c10-full"
    
    
    Previously, operators that have a `Tensor?` (i.e. optional tensor) in their schema implemented it using `Tensor` in C++ and filled in an undefined tensor for the None case.
    The c10 operator library, however, expects `Tensor?` to be represented as `optional<Tensor>`, so those operators couldn't be c10-full yet and still had to use codegenerated unboxing instead of templated unboxing.
    
    This PR changes that. It extends the `hacky_wrapper_for_legacy_signatures` to not only take care of TensorOptions, but now also map between signatures taking `Tensor` and `optional<Tensor>`.
    For this, it requires an additional template parameter, the expected signature, and it uses that to go argument-by-argument and unwrap any optionals it finds.
    
    Differential Revision: [D22607879](https://our.internmc.facebook.com/intern/diff/D22607879/)
    
    [ghstack-poisoned]

---

pointwise_functional
19.750919541344047

pointwise_inplace
12.16628648713231

pointwise_outplace
16.10506245493889

empty
11.773737581446767

contig
9.267851023003459
