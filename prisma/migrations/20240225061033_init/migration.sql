/*
  Warnings:

  - A unique constraint covering the columns `[code]` on the table `Classes` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Classes_code_key" ON "Classes"("code");
