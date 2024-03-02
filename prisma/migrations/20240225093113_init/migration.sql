/*
  Warnings:

  - You are about to drop the `Members` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ClassesToMembers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ClassesToMembers" DROP CONSTRAINT "_ClassesToMembers_A_fkey";

-- DropForeignKey
ALTER TABLE "_ClassesToMembers" DROP CONSTRAINT "_ClassesToMembers_B_fkey";

-- DropTable
DROP TABLE "Members";

-- DropTable
DROP TABLE "_ClassesToMembers";

-- CreateTable
CREATE TABLE "_ClassesToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ClassesToUser_AB_unique" ON "_ClassesToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassesToUser_B_index" ON "_ClassesToUser"("B");

-- AddForeignKey
ALTER TABLE "_ClassesToUser" ADD CONSTRAINT "_ClassesToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassesToUser" ADD CONSTRAINT "_ClassesToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
