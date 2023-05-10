package cu.edu.cujae.structbd.visual;

import cu.edu.cujae.structbd.services.ServicesLocator;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.ImageIcon;
import javax.swing.SwingConstants;
import java.awt.Font;
import java.awt.Image;
import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.Toolkit;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.util.Arrays;
import java.util.Objects;

public class Login extends JFrame {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7989172218145832459L;
	private static Login frame;
	private JPanel contentPane;
	private JLabel ballenaLogo;
	private JLabel lblNewLabel_1;
	private JLabel icoUser;
	private JLabel icoLock;
	private JTextField txtUser;
	private JPasswordField passwordField;
	private JLabel lblNewLabel;
	private JPanel btnLogin;
	private JLabel lblNewLabel_2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					frame = new Login();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
		
	public Login() {
		// setIconImage(Toolkit.getDefaultToolkit().getImage(Login.class.getResource("/com/images/killer-whale.png")));
		setTitle("Autentificaci\u00F3n Transbus");
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(0, 0, Definitions.APP_WIDTH, Definitions.APP_HEIGHT);
		contentPane = new JPanel();
		contentPane.setBackground(Color.WHITE);
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		contentPane.add(getBallenaLogo());
		contentPane.add(getLblNewLabel_1());
		contentPane.add(getIcoUser());
		contentPane.add(getIcoLock());
		contentPane.add(getTxtUser());
		contentPane.add(getPasswordField());
		contentPane.add(getLblNewLabel());
		contentPane.add(getBtnLogin());
		setLocationRelativeTo(null);
		EventQueue.invokeLater( () -> contentPane.requestFocusInWindow() );
	}

	private void toAccess() {
		ServicesLocator.setPassword(String.copyValueOf(getPasswordField().getPassword()));
		ServicesLocator.setUsername(getTxtUser().getText());
		try {
			ServicesLocator.getConnection();
			JOptionPane.showInternalMessageDialog(contentPane,"Autentificación exitosa.","Acceso",JOptionPane.INFORMATION_MESSAGE);
			App p_window = new App();
			p_window.setVisible(true);
			p_window.setLocationRelativeTo(null);
			dispose();
		} catch (Exception e) {
			JOptionPane.showInternalMessageDialog(contentPane,"Usuario o contraseña incorrecta.", "Error", JOptionPane.ERROR_MESSAGE);
		}
	}

	private JLabel getBallenaLogo() {
		if (ballenaLogo == null) {
			ballenaLogo = new JLabel("");
			ballenaLogo.setFont(new Font("Tekton Pro", Font.PLAIN, 5));
			ballenaLogo.setLabelFor(ballenaLogo);
			ballenaLogo.setHorizontalAlignment(SwingConstants.CENTER);
			
			ballenaLogo.setBounds(167, 59, 353, 176);
			//  ImageIcon ico=new ImageIcon(getClass().getResource("/com/images/ballena.png"));
			//  ImageIcon img=new ImageIcon(ico.getImage().getScaledInstance(ballenaLogo.getWidth(), ballenaLogo.getHeight(), Image.SCALE_SMOOTH));
			//  ballenaLogo.setIcon(img);
			
		}
		return ballenaLogo;
	}
	private JLabel getLblNewLabel_1() {
		if (lblNewLabel_1 == null) {
			lblNewLabel_1 = new JLabel("Iniciar Sesi\u00F3n");
			lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 16));
			lblNewLabel_1.setBounds(275, 267, 145, 40);
		}
		return lblNewLabel_1;
	}
	private JLabel getIcoUser() {
		if (icoUser == null) {
			icoUser = new JLabel("");
			icoUser.setBounds(238, 303, 32, 32);
			ImageIcon icoUse=new ImageIcon(Objects.requireNonNull(getClass().getResource("./img/user-solid-240.png")));
			ImageIcon imgUser=new ImageIcon(icoUse.getImage().getScaledInstance(icoUser.getWidth(), icoUser.getHeight(), Image.SCALE_SMOOTH));
			icoUser.setIcon(imgUser);
		}
		return icoUser;
	}
	private JLabel getIcoLock() {
		if (icoLock == null) {
			icoLock = new JLabel("");
			icoLock.setBounds(238, 345, 32, 32);
			ImageIcon icoImgLock=new ImageIcon(Objects.requireNonNull(getClass().getResource("./img/lock-alt-solid-240.png")));
			ImageIcon imgLock=new ImageIcon(icoImgLock.getImage().getScaledInstance(icoLock.getWidth(), icoLock.getHeight(), Image.SCALE_DEFAULT));
			icoLock.setIcon(imgLock);
		}
		return icoLock;
	}
	private JTextField getTxtUser() {
		if (txtUser == null) {
			txtUser = new JTextField();
			txtUser.addFocusListener(new FocusAdapter() {
				@Override
				public void focusGained(FocusEvent e) {
					if (String.valueOf(passwordField.getPassword()).isEmpty()) {
						passwordField.setText("***********");
						passwordField.setForeground(Color.gray);
					}
					if (txtUser.getText().equals("Escriba el usuario")) {
						txtUser.setText("");
						txtUser.setForeground(Color.black);
					}
					
				}
			});
			txtUser.addKeyListener(new KeyAdapter() {
				@Override
				public void keyPressed(KeyEvent e) {
					if(e.getKeyCode()==KeyEvent.VK_ENTER) {
						toAccess();
					}
				}
				@Override
				public void keyTyped(KeyEvent e) {
					if(txtUser.getText().length()>=50) {
						e.consume();
					}
				}
			});
			
			txtUser.setToolTipText("");
			txtUser.setFont(new Font("Tahoma", Font.PLAIN, 12));
			txtUser.setForeground(Color.gray);
			txtUser.setText("Escriba el usuario");
			txtUser.setBounds(275, 303, 145, 32);
			txtUser.setColumns(10);
			txtUser.setBorder(javax.swing.BorderFactory.createEmptyBorder());
		}
		return txtUser;
	}
	private JPasswordField getPasswordField() {
		if (passwordField == null) {
			passwordField = new JPasswordField();
			passwordField.addFocusListener(new FocusAdapter() {
				@Override
				public void focusGained(FocusEvent e) {
					if (String.valueOf(passwordField.getPassword()).equals("***********")) {
						passwordField.setText("");
						passwordField.setForeground(Color.black);
					}
					if (txtUser.getText().isEmpty()) {
						txtUser.setText("Escriba el usuario");
						txtUser.setForeground(Color.gray);
					}
				}
			});
			passwordField.addKeyListener(new KeyAdapter() {
				@Override
				public void keyPressed(KeyEvent e) {
					if(e.getKeyCode()==KeyEvent.VK_ENTER) {
						toAccess();
					}

				}
				@Override
				public void keyTyped(KeyEvent e) {
					if(passwordField.getPassword().length>=50) {
						e.consume();
					}
				}
			});
			passwordField.addMouseListener(new MouseAdapter() {
				@Override
				public void mousePressed(MouseEvent e) {
					
				}
			});
			passwordField.setForeground(Color.gray);
			passwordField.setColumns(1);
			passwordField.setBounds(275, 345, 145, 32);
			passwordField.setText("***********");
			passwordField.setBorder(javax.swing.BorderFactory.createEmptyBorder());
		}
		return passwordField;
	}
	private JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("Control De Acceso");
			lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 19));
			lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
			lblNewLabel.setBounds(238, 30, 202, 19);
		}
		return lblNewLabel;
	}
	private JPanel getBtnLogin() {
		if (btnLogin == null) {
			btnLogin = new JPanel();
			btnLogin.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseEntered(MouseEvent e) {
					btnLogin.setBackground(Color.LIGHT_GRAY);
				}
				@Override
				public void mouseExited(MouseEvent e) {
					btnLogin.setBackground(new Color(240,240,240));
				}
				@Override
				public void mouseClicked(MouseEvent e) {
					toAccess();
				}
			});
			btnLogin.setBounds(275, 387, 135, 32);
			btnLogin.setLayout(null);
			btnLogin.add(getLblNewLabel_2());
		}
		return btnLogin;
	}
	private JLabel getLblNewLabel_2() {
		if (lblNewLabel_2 == null) {
			lblNewLabel_2 = new JLabel("Entrar");
			lblNewLabel_2.setFont(new Font("Tahoma", Font.PLAIN, 14));
			lblNewLabel_2.setHorizontalAlignment(SwingConstants.CENTER);
			lblNewLabel_2.setBounds(0, 0, 135, 32);
		}
		return lblNewLabel_2;
	}
}