// ═══════════════════════════════════════════════════════════════════
// Section 01 — מטא-קוגניציה בכיתה (25 min)
//
// Two beats:
//   1. Why metacognition matters for student learning (evidence)
//   2. The teacher already practices it — reframe
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import LearningCase from './LearningCase';
import PersonalReframe from './PersonalReframe';

const OpeningSection: React.FC = () => (
  <SectionShell id="opening">
    <LearningCase />
    <PersonalReframe />
  </SectionShell>
);

export default OpeningSection;