commit afd2a64a07e142b0444cb8657a2ad1a529b6b082
Merge: 38562132a5 a4cebc4b4e
Author: Sebastian Messmer <messmer@fb.com>
Date:   Thu Jul 30 11:45:35 2020 -0700

    Update on "Change C++ frontend to take optional<Tensor> arguments"
    
    
    Previously, if an op took an optional `Tensor?` argument, the C++ frontend (i.e. `at::op()` and `Tensor::op()`)
    were generated to take `Tensor`. A previous PR (https://github.com/pytorch/pytorch/pull/41610) changed the kernels
    to be written with `c10::optional<Tensor>` instead of `Tensor`, but that did not touch the C++ frontend yet.
    
    This PR changes the C++ frontend API to take `c10::optional<Tensor>` instead of `Tensor` as well.
    This should be mostly bc conserving. Since `Tensor` implicitly converts to `c10::optional<Tensor>`, any old code
    calling an op with a `Tensor` would still work. There are likely corner cases that get broken though.
    For example, C++ only ever does *one* implicit conversion. So if you call an op with a non-tensor object
    that gets implicitly converted to a `Tensor`, then that previously worked since the API took a `Tensor` and
    C++ allows one implicit conversion. Now it wouldn't work anymore because it would require two implicit conversions
    (to `Tensor` and then to `c10::optional<Tensor>`) and C++ doesn't do that.
    
    The main reasons for doing this are
    - Make the C++ API more sane. Those arguments are optional and that should be visible from the signature.
    - Allow easier integration for XLA and Autocast. Those backends generate code to wrap operators and forward
      operator arguments to calls to at::op(). After https://github.com/pytorch/pytorch/pull/41610, there was
      a mismatch because they had to implement operators with `optional<Tensor>` but call `at::op()` with `Tensor`,
      so they had to manually convert between those. After this PR, they can just forward the `optional<Tensor>`
      in their call to `at::op()`.
    
    Differential Revision: [D22704832](https://our.internmc.facebook.com/intern/diff/D22704832/)
    
    [ghstack-poisoned]

---

pointwise_functional

pointwise_inplace

pointwise_outplace

empty

contig

---

pointwise_functional

pointwise_inplace

pointwise_outplace

empty

contig

---

pointwise_functional
23.541484525427222

pointwise_inplace
7.495332069694996

pointwise_outplace
9.290504639968276

empty
10.958333717659116

contig
9.531473869457841

---

pointwise_functional
27.587172839790583

pointwise_inplace
7.860895067453384

pointwise_outplace
8.770794184878469

empty
11.686314903199673

contig
9.827143678441644
