import "github.com/irifrance/gini"
import "github.com/irifrance/gini/logic"

c := logic.NewC()


// suppose we encode package constraints for a module in the circuit c
// and we have a slice S of dependent packages P each of which has an attribute
// P.needsRepl which indicates whether or not it needs to be replaced (of type
// github.com/irifrance/gini/z.Lit)

repls := make([]z.Lit, 0, 1<<23)
for _, p := range pkgs {
    repls = append(repls, p.needsRepl)
}

// make a cardinality constraints object
cards := c.CardSort(repls)

// loop through the constraints (note a linear search
// can be faster than a binary search in this case because the underlying solver
// often has locality of logic cache w.r.t. cardinality constraints)
s := gini.New()
c.ToCnf(s)
minRepls := -1
for i := range repls {
    s.Assume(cards.Leq(i))
    if s.Solve() == 1 {
        minRepls = i
        break
    }
}

// use the model, if one was found, from s to propose a build