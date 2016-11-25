(declare-fun h6 () (_ BitVec 32))
(assert (bvsge h6 (_ bv1 32)) )
(assert (bvsle h6 (_ bv31 32)) )

(declare-fun l0_0 () (_ BitVec 32))
(assert (bvsge l0_0 (_ bv1 32)) )
(assert (bvsle l0_0 (_ bv834443 32)) )

(define-fun PC20 ( (l0_0 (_ BitVec 32)) ) Bool
	(and (and (and (and (and (and (and ( bvsle h6 #x0000001F) ( = ( bvsmod h6 #x00000002) #x00000001)) ( bvsgt ( bvsdiv h6 #x00000002) #x00000000)) (not ( = ( bvsmod ( bvsdiv h6 #x00000002) #x00000002) #x00000001))) (not ( = ( bvsmod ( bvsdiv ( bvsdiv h6 #x00000002) #x00000002) #x00000002) #x00000001))) ( = ( bvsmod ( bvsdiv ( bvsdiv ( bvsdiv h6 #x00000002) #x00000002) #x00000002) #x00000002) #x00000001)) ( bvsle ( bvmul l0_0 ( bvsmod ( bvmul ( bvsmod ( bvmul ( bvsmod ( bvmul ( bvsmod l0_0 #x000CBB8B) ( bvsmod l0_0 #x000CBB8B)) #x000CBB8B) ( bvsmod ( bvmul ( bvsmod l0_0 #x000CBB8B) ( bvsmod l0_0 #x000CBB8B)) #x000CBB8B)) #x000CBB8B) ( bvsmod ( bvmul ( bvsmod ( bvmul ( bvsmod l0_0 #x000CBB8B) ( bvsmod l0_0 #x000CBB8B)) #x000CBB8B) ( bvsmod ( bvmul ( bvsmod l0_0 #x000CBB8B) ( bvsmod l0_0 #x000CBB8B)) #x000CBB8B)) #x000CBB8B)) #x000CBB8B)) #x000CBB8B)) ( bvsle ( bvsdiv ( bvsdiv ( bvsdiv ( bvsdiv h6 #x00000002) #x00000002) #x00000002) #x00000002) #x00000000)) 
)

(assert (PC20 l0_0)) 
(check-sat)
