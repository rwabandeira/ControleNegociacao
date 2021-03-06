/******************************************************************************/
/*                 Generated by IBExpert 12/11/2019 04:36:22                  */
/******************************************************************************/

/******************************************************************************/
/*        Following SET SQL DIALECT is just for the Database Comparer         */
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/


CREATE TABLE ITENS_NEGOCIACOES (
    NEGOCIACAO_ID    INTEGER NOT NULL,
    ITEM_ID          INTEGER NOT NULL,
    PRODUTO_ID       INTEGER NOT NULL,
    QUANTIDADE       NUMERIC(10,2) NOT NULL,
    PRECO_VENDA      NUMERIC(10,2) NOT NULL
);




/******************************************************************************/
/*                             Check constraints                              */
/******************************************************************************/

ALTER TABLE ITENS_NEGOCIACOES ADD CONSTRAINT CHK_ITENS_NEGOC_QUANTIDADE CHECK (QUANTIDADE >= 0);
ALTER TABLE ITENS_NEGOCIACOES ADD CONSTRAINT CHK_ITENS_NEGOC_PRECO_VENDA CHECK (PRECO_VENDA >= 0);


/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE ITENS_NEGOCIACOES ADD CONSTRAINT PK_ITENS_NEGOCIACOES PRIMARY KEY (NEGOCIACAO_ID, PRODUTO_ID);


/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE ITENS_NEGOCIACOES ADD CONSTRAINT FK_ITENS_NEGOCIACOES_NEGOC FOREIGN KEY (NEGOCIACAO_ID) REFERENCES NEGOCIACOES (NEGOCIACAO_ID);
ALTER TABLE ITENS_NEGOCIACOES ADD CONSTRAINT FK_ITENS_NEGOCIACOES_PRODUTO FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (PRODUTO_ID);


/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



SET TERM ; ^



/******************************************************************************/
/*                                 Privileges                                 */
/******************************************************************************/
