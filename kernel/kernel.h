/**
 *  Kernel - SenaOs - Operational System
 *  @version: alfa
 *  @license: GLP
 *
 *
 *
 */
#ifndef KERNEL_H
#define KERNEL_H

/**
 * Função que realiza limpeza do video
 */
void cleanscreen(void);

/**
 *  Função que imprime mensagem pasada como parâmentro no video
 */
unsigned int print(char *message, unsigned int line);

#endif
