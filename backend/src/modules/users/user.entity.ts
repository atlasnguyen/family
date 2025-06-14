import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  username: string;

  @Column()
  password_hash: string;

  @Column({ unique: true, nullable: true })
  email: string;

  @Column()
  type: string; // 'parent' | 'child'

  @CreateDateColumn()
  created_at: Date;
}