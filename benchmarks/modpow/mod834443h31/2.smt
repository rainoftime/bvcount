(declare-fun h2 () (_ BitVec 32))
(assert (bvsge h2 (_ bv1 32)) )
(assert (bvsle h2 (_ bv31 32)) )

(declare-fun l0_0 () (_ BitVec 32))
(assert (bvsge l0_0 (_ bv1 32)) )
(assert (bvsle l0_0 (_ bv834443 32)) )

(define-fun PC2 ( (l0_0 (_ BitVec 32)) ) Bool
	(and (and (and (and (and ( bvsle h2 #x0000001F) ( = ( bvsmod h2 #x00000002) #x00000001)) ( bvsgt ( bvsdiv h2 #x00000002) #x00000000)) ( = ( bvsmod ( bvsdiv h2 #x00000002) #x00000002) #x00000001)) ( bvsle ( bvmul l0_0 ( bvsmod ( bvmul ( bvsmod l0_0 #x000CBB8B) ( bvsmod l0_0 #x000CBB8B)) #x000CBB8B)) #x000CBB8B)) ( bvsle ( bvsdiv ( bvsdiv h2 #x00000002) #x00000002) #x00000000)) 
)

(assert (PC2 l0_0)) 
(check-sat)