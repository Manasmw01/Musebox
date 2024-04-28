%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %{tool}
% file : big_bubbas_fft_tb.m
%
% Description : The following Matlab testbench excercises the Altera FFT Model big_bubbas_fft_model.m
% generated by Altera's FFT Megacore and outputs results to text files.
%
% 2001-2009 Altera Corporation, All Rights Reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameterization Space    
N=16384;
% Read input complex vector from source text files
fidr = fopen('big_bubbas_fft_real_input.txt','r');                                            
fidi = fopen('big_bubbas_fft_imag_input.txt','r');                                           
xreali=fscanf(fidr,'%d');                                                    
ximagi=fscanf(fidi,'%d');                                                    
fclose(fidi);                                                                  
fclose(fidr);                                                                
% Create input complex row vector from source text files 
x = xreali' + j*ximagi';                                                        
[y, exp_out] = big_bubbas_fft_model(x,N,0); 
fidro = fopen('big_bubbas_fft_real_output_c_model.txt','w');                                 
fidio = fopen('big_bubbas_fft_imag_output_c_model.txt','w');                                  
fideo = fopen('big_bubbas_fft_exponent_out_c_model.txt','w');                                 
fprintf(fidro,'%d\n',real(y));                                                
fprintf(fidio,'%d\n',imag(y));                                                
fprintf(fideo,'%d\n',exp_out);                                               
fclose(fidro);                                                                
fclose(fidio);                                                              
fclose(fideo);                                                                 
