(declare-fun h3 () (_ BitVec 32))
(assert (bvsge h3 (_ bv1 32)) )
(assert (bvsle h3 (_ bv7 32)) )

(declare-fun l0_0 () (_ BitVec 32))
(assert (bvsge l0_0 (_ bv1 32)) )
(assert (bvsle l0_0 (_ bv1964903306 32)) )

(define-fun PC4 ( (l0_0 (_ BitVec 32)) ) Bool
	(and (and (and (and (and ( bvsle h3 #x00000007) ( = ( bvsmod h3 #x00000002) #x00000001)) ( bvsgt ( bvsdiv h3 #x00000002) #x00000000)) ( = ( bvsmod ( bvsdiv h3 #x00000002) #x00000002) #x00000001)) ( bvsgt ( bvmul l0_0 ( bvsmod ( bvmul ( bvsmod l0_0 #x751E0B8A) ( bvsmod l0_0 #x751E0B8A)) #x751E0B8A)) #x751E0B8A)) ( bvsle ( bvsdiv ( bvsdiv h3 #x00000002) #x00000002) #x00000000)) 
)

(assert (PC4 l0_0)) 
(check-sat)