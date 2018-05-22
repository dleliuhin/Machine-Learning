oneway.plot               package:DAAG               R Documentation

_D_i_s_p_l_a_y _o_f _O_n_e _W_a_y _A_n_a_l_y_s_i_s _R_e_s_u_l_t_s

_D_e_s_c_r_i_p_t_i_o_n:

     A line plot of means for unstructured comparison.

_U_s_a_g_e:

     oneway.plot(obj = rice.aov, axisht = 6, xlim = NULL, xlab = NULL,
         lsdht = 1.5, hsdht = 0.5, textht = axisht - 2.5, oma = rep(1,
             4), angle = 80, alpha = 0.05)

_A_r_g_u_m_e_n_t_s:

     obj: One way analysis of variance object (from aov)

  axisht: Axis height

    xlim: Range on horizontal axis

    xlab: Horizontal axis label

   lsdht: Height adjustment parameter for LSD comparison plot

   hsdht: Height adjustment parameter for Tukey's HSD comparison  plot

  textht: Height of text

     oma: Outer margin area

   angle: Text angle (in degrees)

   alpha: Test size

_V_a_l_u_e:

     A line plot

_A_u_t_h_o_r(_s):

     J.H. Maindonald

_E_x_a_m_p_l_e_s:

     rice.aov <- aov(ShootDryMass ~ trt, data=rice)
     oneway.plot(obj=rice.aov)

