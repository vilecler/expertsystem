;; met � jours des initiales values
(defparameter  deja_fait_hypnotise nil)
(defparameter  deja_vu_hypnose nil)
(defparameter  crois_hypnose nil)

(defparameter  receptivite 0)

(defparameter  test_de_receptivite_faits 0)
(defparameter  test_mains_aimantees nil)
(defparameter  test_livres_et_ballons nil)
(defparameter  test_doigts_colles nil)

(defparameter premiere_induction nil)
(defparameter inductions_faites 0)

(defparameter  mains_collees nil)
(defparameter  bouton_rire nil)
(defparameter  oublie_prenom nil)
(defparameter  imaginer_gout nil)
(defparameter  assis_debout nil)
(defparameter  philtre_amour nil)
(defparameter  blackout nil)
(defparameter  catalepsie_integrale nil)
(defparameter  musicologie nil)
(defparameter  freeze_defreeze nil)
(defparameter  changer_langue nil)
(defparameter  dark_vador nil)
(defparameter  gagner_loto nil)

(defparameter  travail_catalepsie 0)
(defparameter  travail_emmotionnel 0)
(defparameter  travail_amnesie 0)


;;liste variables qui peuvent �tre demand�es
(defparameter vars '(
    test_mains_aimantees
    test_livres_et_ballons
    test_doigts_colles
    premiere_induction
    mains_collees
    bouton_rire
    oublie_prenom
    imaginer_gout
    assis_debout
    philtre_amour
    blackout
    catalepsie_integrale
    musicologie
    freeze_defreeze
    changer_langue
    dark_vador
    gagner_loto
  )
)

;; but
(defparameter *but* '((eq gagner_loto 'fait)))

;; base de fait
(defparameter *BF* '())

;; base de r�gles
;; utilisez fonction 'eval' pour mis a jour les valeurs
;; par exemple
;; (setq *BR* (R1 ((eq deja_fait_hypnotise t)) ((setq receptivite 50))))
;; (eval (caaddr *br*))
;; receptivite -> 50
(defparameter *BR* '(
    (R1 ((eq deja_fait_hypnotise t)) ((setq receptivite 50)) "Vous vous �tes d�j� fait hypnotiser, quelle chance !")
    (R2 ((eq deja_fait_hypnotise nil) (eq deja_vu_hypnose t) (eq crois_hypnose t)) ((setq receptivite 25)) "Vous y croyez et vous en avez d�j� vu, pas de raison que cela ne fonctionne pas !")
    (R3 ((eq deja_fait_hypnotise nil) (eq deja_vu_hypnose nil) (eq crois_hypnose t)) ((setq receptivite 15)) "Au moins vous croyez � l'hypnose.")
    (R4 ((eq deja_fait_hypnotise nil) (eq deja_vu_hypnose t) (eq crois_hypnose nil)) ((setq receptivite 10)) "Vous avez d�j� vu de l'hypnose mais vous n'y croyez pas. On ne peut pas �tre parfait.")
    (R5 ((eq deja_fait_hypnotise nil) (eq deja_vu_hypnose nil) (eq crois_hypnose nil)) ((setq receptivite 5)) "Vous ne croyez pas � l'hypnose : vous irez en enfer. Mais pas de soucis, nous allons quand m�me essayer !")
    (R6 ((<= receptivite 99)(eq test_de_receptivite_faits 0)) ((setq test_mains_aimantees 'demander)) "Attention, nous allons tenter de coller vos mains.
Je place un aimant dans chacune de vos mains maintenant.
Elle se rapproche de plus en plus et de mieux en mieux.
Les mains vont se toucher dans 5 secondes ou dans 20 secondes...
Quand elles se toucheront, vous serez 5 fois plus d�tendu.
Est-ce que vos mains se sont coll�es ? Avez-vous ressenti quelque chose ?")
    (R7 ((eq test_mains_aimantees 'fait)) ((setq test_de_receptivite_faits 1) (setq receptivite (+ receptivite 10))) "J'ai r�ussi le test des mains aimant�es sur vous.")
    (R8 ((<= receptivite 91) (eq test_de_receptivite_faits 1)) ((setq test_livres_et_ballons 'demander)) "Mettez vos bras devant vous et fermez les yeux.
Tournez une main vers le ciel, celle que vous voulez (le ciel c'est en haut).
Dans cette main, je mets un petit gravillon qui double de poids, de taille, de volume � chaque claquement de doigts.
Dans l'autre main j'attache des ballons en h�lium tout l�gers commre � la f�te foraine qui tirent ce bras de plus en plus et de mieux en mieux vers le ciel et j'en ajoute � chaque claquement de doigts...
Cela a-t-il fonctionn� ? Avez-vous ressenti quelque chose ?")
    (R9 ((eq test_livres_et_ballons 'fait)) ((setq test_de_receptivite_faits 2) (setq receptivite (+ receptivite 10))) "J'ai r�ussi le test des livres et ballons sur vous.")
    (R10 ((<= receptivite 61) (eq test_de_receptivite_faits 2)) ((setq test_doigts_colles 'demander)) "Mettez vos deux index faces � faces proches de votre regard et �cartez-les de quelques centim�tres.
Vous imaginez que j'ai plac� un aimaint sur chacun des index et qu'ils s'attirent maintenant, de plus en plus et de mieux en mieux.
Au moment o� les doigts se touchent, ils commencent � se coller l'un � l'autre.
Compl�tement coll�s, compl�tement impr�gn�s, ils sont impossibles � retirer...
Avez-vous ressenti quelque chose ? Vos doigts se sont-ils coll�s ?")
    (R11 ((eq test_doigts_colles 'fait)) ((setq test_de_receptivite_faits 3) (setq receptivite (+ receptivite 10))) "J'ai r�ussi le test des doigts coll�s sur vous.")
    (R12 ((eq test_de_receptivite_faits 3)) ((setq inductions_faites 1) (setq premiere_induction 'demander)) "Je vais tenter de vous endormir.
A un moment je proncerai le mot 'dors',
cela n'aura rien � voir avec le sommeil mais vous vous sentirez beaucoup plus d�tendu et partirez profond�ment � l'int�rieur de vous-m�me.
Dors !")
    (R13 ((eq test_de_receptivite_faits 1) (eq test_livres_et_ballons 'echec)) ((setq inductions_faites 1) (setq premiere_induction 'demander)) "Je vais tenter de vous endormir.
A un moment je proncerai le mot 'dors',
cela n'aura rien � voir avec le sommeil mais vous vous sentirez beaucoup plus d�tendu et partirez profond�ment � l'int�rieur de vous-m�me.
Dors !")
    (R14 ((eq test_de_receptivite_faits 2) (eq test_doigts_colles 'echec)) ((setq inductions_faites 1) (setq premiere_induction 'demander)) "Je vais tenter de vous endormir.
A un moment je proncerai le mot 'dors',
cela n'aura rien � voir avec le sommeil mais vous vous sentirez beaucoup plus d�tendu et partirez profond�ment � l'int�rieur de vous-m�me.
Dors !")
    (R15 ((eq premiere_induction 'fait)) ((setq receptivite (+ receptivite 5))) "J'ai r�ussi � faire la premi�re induction.")
    (R16 ((eq premiere_induction 'echec)) ((setq receptivite 0)) "Si je n'arrive pas la premi�re induction, je n'arriverai pas � vous hypnotiser.")
    (R17 ((eq test_mains_aimantees 'echec)) ((setq receptivite 0)) "Vous n'�tes pas assez r�ceptif, autant s'arr�ter-l�. J'ai besoin de r�ussir le premier test de receptivit�.")
    (R18 ((>= receptivite 30)) ((setq mains_collees 'demander)) "Vous �tes assez receptif pour qu'on tente de coller une de vos main.
J'applique une colle hypnotique qui est capalble de coller n'importe quoi au compte de trois.
Avec le 1, la colle s�che, on sent que quelque chose se passe.
Avec le deux, la main est compl�tement coll�e, la colle est compl�tement s�che.
Avec le trois, la main est compl�tement coll�e, compl�tement impr�gn�e, impossible � retirer !
A chaque fois qu'on essaye de la d�coller, elle se colle de plus en plus et de mieux en mieux.")
    (R19 ((eq mains_collees 'fait)) ((setq  receptivite (+ receptivite 5)) (setq travail_catalepsie 1)) "J'ai r�ussi � coller vos mains.")
    (R20 ((>= receptivite 35)) ((setq bouton_rire 'demander)) "Vous �tes assez receptif pour qu'on tente de vous mettre un bouton rire.
A votre r�veil, il y aura un petit bouton sur votre �paule droite.
Lorsque l'on appuie dessus, c'est compl�tement stupide mais vous �clatez de rire !")
    (R21 ((eq bouton_rire 'fait)) ((setq receptivite (+ receptivite 10)) (setq travail_emmotionnel 1)) "J'ai r�ussi � vous mettre un bouton rire.")
    (R22 ((>= receptivite 45)) ((setq oublie_prenom 'demander)) "Vous �tes assez receptif pour qu'on tente de vous faire oublier votre pr�nom.
Je colle cette main sur cette t�te. Un, deux, trois, compl�tement coll�e, compl�tement impr�gn�e.
Au compte de trois je vais retirer cette main qui est au fait une ventouse. Elle va aspirer toutes les lettres de votre pr�nom.
C'est comme si on avait mis les lettres dans une petite boite et qu'on �tait parti de l'autre c�t� de la Terre sans jamais la retrouver.
C'est comme quand on a un truc sur le bout de la langue, qu'on sait qu'on l'a, qu'on sait qu'on peut le dire mais que �a part deux fois plus loin, trois fois plus loin.
Un, deux, trois.")
    (R23 ((eq oublie_prenom 'fait)) ((setq receptivite (+ receptivite 5)) (setq travail_amnesie 1)) "J'ai r�ussi � vous faire oublier votre pr�nom.")
    (R24 ((>= receptivite 50)) ((setq imaginer_gout 'tester)) "Vous �tes assez receptif pour qu'on tente de vous faire imaginer un go�t.")
    (R25 ((>= receptivite 50)) ((setq assis_debout 'tester)) "Vous �tes assez receptif pour qu'on tente de faire un assis/debout")
    (R26 ((>= receptivite 65)) ((setq philtre_amour 'tester)) "Vous �tes assez receptif pour qu'on tente de vous donner un philtre d'amour.")
    (R27 ((>= receptivite 65)) ((setq blackout 'tester)) "Vous �tes assez receptif pour qu'on tente de vous faire un blackout.")
    (R28 ((>= receptivite 70)) ((setq catalepsie_integrale 'tester)) "Vous �tes assez receptif pour qu'on tente de vous faire une catalepsie integrale.")
    (R29 ((>= receptivite 70)) ((setq musicologie 'tester)) "Vous �tes assez receptif pour qu'on tente de faire une exp�rience de musicologie.")
    (R30 ((>= receptivite 80)) ((setq freeze_defreeze 'tester)) "Vous �tes assez receptif pour qu'on tente de faire un freeze-defreeze.")
    (R31 ((>= receptivite 85)) ((setq changer_langue 'tester)) "Vous �tes assez receptif pour qu'on tente vous faire parler une autre langue.")
    (R32 ((>= receptivite 90)) ((setq dark_vador 'tester)) "Vous �tes assez receptif pour qu'on tente de vous faire croire que Dark Vador est � c�t� de vous.")
    (R33 ((>= receptivite 100)) ((setq gagner_loto 'tester)) "Vous �tes assez receptif pour qu'on tente de vous faire croire que vous avez gagn� au loto.")
    (R34 ((eq imaginer_gout 'tester) (>= travail_emmotionnel 1)) ((setq imaginer_gout 'demander)) "Lorsque je dis le mot 'chocolat' vous aurez instantan�ment le go�t de chocolat dans la bouche.
Quand je dis le mot 'citron' vous avez instantan�ment le go�t acide du citron dans la bouche...")
    (R35 ((eq imaginer_gout 'fait)) ( (setq receptivite (+ receptivite 15)) (setq travail_emmotionnel (+ travail_emmotionnel 1))) "J'ai r�ussi � vous faire imaginer un go�t.")
    (R36 ((eq assis_debout 'tester) (>= travail_amnesie 1)) ((setq assis_debout 'demander)) "A partir de maintenant quand vous vous asseyez, vous oubliez que vous voulez vous assoir et vous vous levez.
Quand vous �tes debout, vous oubliez que vous voulez vous lever et vous vous asseyez...")
    (R37 ((eq assis_debout 'fait)) ( (setq receptivite (+ receptivite 15)) (setq travail_amnesie (+ travail_amnesie 1))) "J'ai r�ussi � vous faire un assis/debout.")
    (R38 ((eq philtre_amour 'tester) (>= travail_emmotionnel 1)) ((setq philtre_amour 'demander)) "A votre r�veil, vous tomberez instantan�ment amoureux de la premi�re personne en face de vous.
C'est l'amour de votre vie, vous l'adorez, vous la voulez rien que pour vous !
Vous �tes super heureux de la voir, fou de joie ! R�veillez-vous.")
    (R39 ((eq philtre_amour 'fait)) ( (setq receptivite (+ receptivite 10)) (setq travail_emmotionnel (+ travail_emmotionnel 1))) "J'ai r�ussi � vous donner un philtre d'amour.")
    (R40 ((eq blackout 'tester) (>= travail_amnesie 1)) ((setq blackout 'demander)) "A votre r�veil, vous aurez tout oublier, comme lorsqu'on se r�veille d'une soir�e trop arros�e :
vous ne savez pas o� vous �tes, ce que vous faites l�, avec qui vous �tes...
Vous ne comprennez rien � la situation que vous vivez, comme si vous d�barquiez d'une autre plan�te lointaine, tr�s lointaine...")
    (R41 ((eq blackout 'fait)) ((setq receptivite (+ receptivite 5)) (setq travail_amnesie (+ travail_amnesie 1))) "J'ai r�ussi � vous faire croire � un blackout.")
    (R42 ((eq catalepsie_integrale 'tester) (>= travail_catalepsie 1)) ((setq catalepsie_integrale 'demander)) "A votre r�veil tous vos muscles seront compl�tement fig�s.
Nous allons faire une vague qui fige le corps comme une statue qui part des pieds, qui remonte vers les jambes, le bassin, les �paules, les bras, la t�te, et partout dans le corps.
Vous �tes compl�tement fig�, tous vos muscles sont contract�s et durs comme de la brique...
Un, deux, trois, r�veillez-vous")
    (R43 ((eq catalepsie_integrale 'fait)) ((setq receptivite (+ receptivite 10)) (setq travail_catalepsie (+ travail_catalepsie 1))) "J'ai r�ussi � vous faire une catalepsie int�grale.")
    (R44 ((eq musicologie 'tester)(>= travail_emmotionnel 2) (>= travail_amnesie 1)) ((setq musicologie 'demander)) "A votre r�veil, vous serez capable de voir la musique.
A chaque changement de musique, vous serez projeter instantan�ment dans une ambiance, un d�cor li� � la musique que vous �coutez...
Un, deux, trois, r�veillez-vous")
    (R45 ((eq musicologie 'fait)) ((setq receptivite (+ receptivite 10)) (setq travail_emmotionnel (+ travail_emmotionnel 1)) (setq travail_amnesie (+ travail_amnesie 1))) "J'ai r�ussi l'exp�rience du musicologie sur vous.")
    (R46 ((eq freeze_defreeze 'tester) (>= travail_catalepsie 2) (>= travail_amnesie 2)) ((setq freeze_defreeze 'demander)) "A votre reveil, au mot 'freeze' votre corps devient instantan�ment fig� comme une statue, au mot 'defreeze' vous pouvez bougez normalement comme si rien ne s'�tait pass�.
Par contre, vous oubliez absolument tout ce qui se passe entre le mot 'freeze' et le mot 'defreeze'...")
    (R47 ((eq freeze_defreeze 'fait)) ((setq receptivite (+ receptivite 10)) (setq travail_catalepsie (+ travail_catalepsie 1)) (setq travail_amnesie (+ travail_amnesie 1))) "J'ai r�ussi � vous faire un freeze/defreeze.")
    (R48 ((eq changer_langue 'tester) (>= travail_emmotionnel 2) (>= travail_amnesie 3)) ((setq changer_langue 'demander)) "A votre r�veil, vous parlerez dans une autre langue compl�ment inconnue que seul vous connaissez.
C'est pour vous parfaitement normal de parler cette langue puisque vous l'avez toujours fait et que cela n'a jamais pos� de probl�me.
Par contre, vous comprenez notre langue mais vous �tes oblig� de r�pondre dans votre langue...
Un, deux, trois, ouvrez les yeux.")
    (R49 ((eq changer_langue 'fait)) ((setq receptivite (+ receptivite 5)) (setq travail_emmotionnel (+ travail_emmotionnel 1)) (setq travail_amnesie (+ travail_amnesie 1))) "J'ai r�ussi � vous faire changer de langue.")
    (R50 ((eq dark_vador 'tester) (>= travail_emmotionnel 3) (>= travail_amnesie 3)) ((setq dark_vador 'demander)) "A votre r�veil, il y aura � c�t� de vous Dark Vador. Le seul, le vrai, l'unique... Un, deux, trois, r�veillez-vous.")
    (R51 ((eq dark_vador 'fait)) ((setq receptivite (+ receptivite 10)) (setq travail_emmotionnel (+ travail_emmotionnel 1)) (setq travail_amnesie (+ travail_amnesie 1))) "J'ai r�ussi � vous faire croire qu'il y avait Dark Vador.")
    (R52 ((eq gagner_loto 'tester) (>= travail_emmotionnel 4) (>= travail_amnesie 3)) ((setq gagner_loto 'demander)) "A votre r�veil, quelqu'un vous donnera un morceau de papier, vous lirez dessus que vous avez gagn� au Loto.
C'est pour vous incroyable, vous �tes fous de joie, vous venez de gagnez 10 millions d'euros, vous n'en revenez pas !
Ouvrez les yeux." );
    (R53 ((eq gagner_loto 'fait)) ((setq receptivite 99)) "J'ai r�ussi � vous faire croire que vous avez gagn� au Loto.")
    )
)

;;;Fonctions de service
;Pour une regle donnee
(defun nom_regle (regle)
  (first regle)
)

(defun conditions_regle (regle)
  (second regle)
)

(defun actions_regle (regle)
  (third regle)
)

(defun description_regle (regle)
  (car (last regle))
)

;Pour obtenir une regle a partir de son nom
(defun get_regle (nom_regle BR)
  (assoc nom_regle BR)
)

;tester avec (evaluer_regle (get_regle 'R30 *BR*))
(defun evaluer_regle (regle)
  (let ((retour T))
    (dolist (condition (conditions_regle regle))
      (if (not (eval condition))
        (setq retour NIL)
      )
    )
    retour
  )
)

;applique la regle sans verifier si elle est vraie (appliquer_regle (get_regle 'R30 *BR*))
(defun appliquer_regle (regle)
  (dolist (action (actions_regle regle) T)
    (eval action)
  )
)

;Permet de demander si un effet hypnotique a fonctionn� ou none
;il faut parfois appuer plusieurs fois sur entrer pour lire la donn�e
; exemple (demander_fait 'mains_collees)
(defun demander_fait (fai)
  (if (equal (eval fai) 'demander)
    (progn
      (format t "~d" (concatenate 'string "On a besoin du savoir si l'effet hypnotique " (write-to-string fai) " a fonctionn�. A-t-il fonctionn� oui ou non ? O/n"))
      (princ "> ")
      (let ((ligne (read-line)))
        (if (or (equal ligne "O") (equal ligne "o"))
          (progn
            (setf (symbol-value fai) 'fait) ;ou  `(setf ,fai ,value)) pour enlever la quote
            (return-from demander_fait T)
          )
          (progn
            (setf (symbol-value fai) 'echec) ;ou  `(setf ,fai ,value)) pour enlever la quote
            (return-from demander_fait NIL)
          )
        )
      )
    )
  )
)

;Permet de demander toutes les variables disponibles
; exemple (check_demander vars)
(defun check_demander (variables)
  (dolist (var variables)
    (demander_fait var)
  )
)

;permet de savoir si on a accompli le but ou non
;exempel : (but_accompli *but*)
(defun but_accompli (buts)
  (let ((retour NIL))
    (dolist (condition buts)
      (if (eval condition)
        (setq retour T)
      )
    )
    retour
  )
)

(defun regle_faite (regle BF)
  (if (not (member (nom_regle regle) BF))
    (push (nom_regle regle) BF)
  )
  BF
)

(defun toutes_regles_faites (BR BF)
  (let ((retour T))
    (dolist (regle BR retour)
      (if (not(member (nom_regle regle) BF))
        (setq retour NIL)
      )
    )
  )
)

;exemple (declencher_moteur_avant *BR* *BF* *but* vars)
(defun declencher_moteur_avant (BR BF but variables)
  ;Liste des questions pour la base de faits
  (format t "~d" "Vous �tes-vous deja fait hypnotiser ? O/n")
  (princ "> ")
  (let ((ligne (read-line)))
    (if (or (equal ligne "O") (equal ligne "o"))
      (setq deja_fait_hypnotise t)
      (progn
        (format t "~d" "Avez-vous d�j� vu de l'hypnose ? O/n")
        (princ "> ")
        (let ((ligne_deux (read-line)))
          (if (or (equal ligne_deux "O") (equal ligne_deux "o"))
            (setq deja_vu_hypnose t)
          )
        )
        (format t "~d" "Croyez-vous � l'hypnose ? O/n")
        (princ "> ")
        (let ((ligne_deux (read-line)))
          (if (or (equal ligne_deux "O") (equal ligne_deux "o"))
            (setq crois_hypnose t)
          )
        )
      )
    )
  )
  (terpri)
  (moteur_avant BR BF but variables)
)

; exemple (moteur_avant *BR* *BF* *but* vars)
(defun moteur_avant (BR BF but variables)
  (let ((copie_BF BF))
      ;(print "nouveau moteur_avant")
      ;(sleep 1)
      (dolist (regle BR)
        (if (and (not (member (nom_regle regle) BF)) (equal copie_BF BF))
          (if (and (evaluer_regle regle) T)
            (cond
              (T
                ;(print (nom_regle regle))
                (terpri)
                (format t "~d" (description_regle regle))
                (terpri)
                (terpri)
                (appliquer_regle regle)
                (setf BF (regle_faite regle BF))
                (check_demander variables)
              )
            )
          )
        )
      )
      (if (and (not (toutes_regles_faites BR BF)) (not (but_accompli but)) (not (equal copie_BF BF)))
        (moteur_avant BR BF but variables)
        (progn
          (if (but_accompli but)
            (format t "~d" "F�licitations � vous, le but est atteint !")
            (format t "~d" "Fin du moteur avant. Vous n'�tes pas assez r�ceptif � l'hypnose, essayez une autre fois.")
          )
          (terpri)
        )
      )
    )
)

(defun debut ()
  (declencher_moteur_avant *BR* *BF* *but* vars)
)


;;; Jeu de test
;;; (load "tp3.cl")
;;; (debut)
;;;
;;; Changer but :
;;; (defparameter *but* '((eq dark_vador 'fait)))
;;; (defparameter *but* '((eq premiere_induction 'fait)))
