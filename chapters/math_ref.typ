#import "../suda-typst-template/lib.typ": tablex, imagex, subimagex, theorem, proof, table-note, equate


= 数学与引用文献的标注

== 数学

=== 数学和单位

包 `unify` 提供了更好的数字和单位支持，但与 `siunitx` 相比，只支持了`num`, `unit`, `qty`, `numrange`, `qtyrange` 五个函数：

#import "@preview/unify:0.7.1": *

- $num("-1.32865+-0.50273e-6")$
- $num("0.3e45", multiplier: "times")$
- $unit("kg m/s")$
- $unit("ohm")$
- $qty("0.13", "mm")$
- $qty("1.3+1.2-0.3e3", "erg/cm^2/s", space: "#h(2mm)")$
- $numrange("1,1238e-2", "3,0868e5", thousandsep: "'")$
- $numrange("10", "20", delimiter: "tilde")$
- $qtyrange("1e3", "2e3", "meter per second squared", per: "\\/", delimiter: "\"to\"")$
- $qtyrange("10", "20", "celsius", delimiter: "tilde")$

=== 数学符号和公式

按照国标GB/T3102.11—1993《物理科学和技术中使用的数学符号》，微分符号 $dif$ 应使用直立体。除此之外，数学常数也应使用直立体：

#let bf(x) = math.bold(math.upright(x))
#let ppi = $upright(pi)$
#let ee = $upright(e)$
#let ii = $upright(i)$

- 微分符号 $dif$： `dif`
- 圆周率 $ppi$： `upright(pi)`
- 自然对数的底 $ee$： `upright(e)`
- 虚数单位 $ii$： `upright(i)`

公式应另起一行居中排版。公式后应注明编号，按章顺序编排，编号右端对齐，如@equation 所示。

$
  ee^(ii ppi) + 1 = 0, \
  (dif^2 u) / (dif t^2) = integral f(x) dif x.
$ <equation>

公式末尾是需要添加标点符号的，至于用逗号还是句号，取决于公式下面一句是接着公式说的，还是另起一句。

$
  (2h) / ppi limits(integral)_0^infinity (sin (omega delta)) / omega cos (omega x) dif omega = cases(
    h "," quad abs(x) < delta ",",
    h / 2 "," quad x = plus.minus delta ",",
    0 "," quad abs(x) > delta"."
  )
$

公式较长时最好在等号“$=$”处转行。子公式的引用请在该行公式后添加 `#<subequation>` 引用标签，如@subequation 所示。如果有某行公式不需要编号，请使用 `#<equate:revoke>` 标签。（此标签由 `equate` 包定义，目前不可自定义）

$
    & I(X_3; X_4) - I(X_3; X_4 | X_1) - I(X_3; X_4 | X_2) #<equate:revoke> \
  = & [I(X_3; X_4) - I(X_3; X_4 | X_1)] - I(X_3; X_4 | tilde(X_2)) \
  = & I(X_1; X_3; X_4) - I(X_3; X_4 | tilde(X_2)). #<subequation>
$

如果在等号处转行难以实现，也可在 $+$、$-$、$times$、$div$ 运算符号处转行，转行时运算符号仅书写于转行式前，不重复书写。

$
  1 / 2 Delta(f_(i j) f^(i j)) = 2 med &(sum_(i<j) x_(i j) (sigma_i - sigma_j)^2 + f_(i j) nabla_j nabla_i (Delta f) #<equate:revoke> \
    &+ nabla_k f_(i j) nabla^k f^(i j) + f^(i j) f^k [2 nabla_i R_(j k) - nabla_k R_(i j)]).
$

=== 定理环境

示例文件中使用 `theorion` 宏包配置了定理、引理和证明等环境。

这里举一个“定理”和“证明”的例子。

#let Res = math.op("Res")

#theorem(title: "留数定理")[
  假设 $U$ 是复平面上的一个单连通开子集，$a_1, dots, a_n$ 是复平面上有限个点，$f$ 是定义在 $U without {a_1, dots, a_n}$ 上的全纯函数，如果 $gamma$ 是一条把 $a_1, dots, a_n$ 包围起来的可求长曲线，但不经过任何一个 $a_k$，并且其起点与终点重合，那么：

  $
    limits(integral.cont)_gamma f(z) dif z = 2 ppi ii sum_(k=1)^n op(I)(gamma, a_k) Res(f, a_k).
  $ <res>

  如果 $gamma$ 是若尔当曲线，那么 $op(I)(gamma, a_k) = 1$，因此：

  $
    limits(integral.cont)_gamma f(z) dif z = 2 ppi ii sum_(k=1)^n Res(f, a_k).
  $ <resthm>

  在这里，$Res(f, a_k)$ 表示 $f$ 在点 $a_k$ 的留数，$op(I)(gamma, a_k)$ 表示 $gamma$ 关于点 $a_k$ 的卷绕数。卷绕数是一个整数，它描述了曲线 $gamma$ 绕过点 $a_k$ 的次数。如果 $gamma$ 依逆时针方向绕着 $a_k$ 移动，卷绕数就是一个正数，如果 $gamma$ 根本不绕过 $a_k$，卷绕数就是零。

  @thm:res 的证明。

  #proof[
    首先，由……

    其次，……

    所以……
  ]
] <thm:res>

== 引用文献的标注

正文中引用参考文献时，使用 `@vaswani2017attention @devlin2019bert` 可以产生“上标引用的参考文献”，如 @vaswani2017attention @devlin2019bert。

Typst 使用 Hayagriva 管理参考文献，有部分细节问题还在逐步修复。