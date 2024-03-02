/*
  Warnings:

  - You are about to drop the `MembersOnClasses` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "MembersOnClasses" DROP CONSTRAINT "MembersOnClasses_classesId_fkey";

-- DropForeignKey
ALTER TABLE "MembersOnClasses" DROP CONSTRAINT "MembersOnClasses_memberId_fkey";

-- DropTable
DROP TABLE "MembersOnClasses";

-- CreateTable
CREATE TABLE "_ClassesToMembers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ClassesToMembers_AB_unique" ON "_ClassesToMembers"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassesToMembers_B_index" ON "_ClassesToMembers"("B");

-- AddForeignKey
ALTER TABLE "_ClassesToMembers" ADD CONSTRAINT "_ClassesToMembers_A_fkey" FOREIGN KEY ("A") REFERENCES "Classes"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassesToMembers" ADD CONSTRAINT "_ClassesToMembers_B_fkey" FOREIGN KEY ("B") REFERENCES "Members"("id") ON DELETE CASCADE ON UPDATE CASCADE;
